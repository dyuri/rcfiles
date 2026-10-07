import nodePath from "node:path";
import { toDisplayPath } from "./display-path.js";
import { isRecord } from "./text.js";
import type { InspectWorkspacePulseOptions, WorkspacePulseInspection } from "./workspace-pulse.js";

export interface JjWorkspaceIdentity {
	changeId: string;
	bookmarks: string[];
	description?: string;
	nearestBookmark?: { name: string; distance: number };
}

interface JjRevision {
	commit: string;
	parents: string[];
	change: string;
	bookmarks: string[];
	description: string;
	current: boolean;
}

const JJ_TIMEOUT_MS = 2_000;
// Pin the current operation as well as ignoring the working copy: inspection must
// neither snapshot files nor reconcile concurrent jj operations.
const JJ_READ_FLAGS = ["--ignore-working-copy", "--at-op=@", "--no-pager", "--color", "never"];
const JJ_LOG_TEMPLATE = String.raw`'{"commit":"' ++ commit_id ++ '","parents":[' ++ parents.map(|p| '"' ++ p.commit_id() ++ '"').join(',') ++ '],"change":"' ++ change_id.short(8) ++ '","bookmarks":[' ++ local_bookmarks.map(|b| b.name().escape_json()).join(',') ++ '],"description":' ++ if(current_working_copy, description.first_line().escape_json(), '""') ++ ',"current":' ++ current_working_copy ++ '}' ++ "\n"`;

function stringList(value: unknown): value is string[] {
	return Array.isArray(value) && value.every((item) => typeof item === "string");
}

function parseRevisions(output: string): Map<string, JjRevision> {
	const revisions = new Map<string, JjRevision>();
	for (const line of output.trimEnd().split("\n")) {
		const row: unknown = JSON.parse(line);
		if (
			!isRecord(row) ||
			typeof row.commit !== "string" ||
			!row.commit ||
			!stringList(row.parents) ||
			typeof row.change !== "string" ||
			!row.change ||
			!stringList(row.bookmarks) ||
			typeof row.description !== "string" ||
			typeof row.current !== "boolean"
		) {
			throw new Error("Invalid jj revision metadata");
		}
		revisions.set(row.commit, {
			commit: row.commit,
			parents: row.parents,
			change: row.change,
			bookmarks: row.bookmarks,
			description: row.description,
			current: row.current,
		});
	}
	return revisions;
}

/** Breadth-first traversal gives shortest parent-path distance, including merges. */
function nearestBookmark(
	current: JjRevision,
	revisions: ReadonlyMap<string, JjRevision>,
): JjWorkspaceIdentity["nearestBookmark"] {
	let frontier = [current.commit];
	const visited = new Set(frontier);
	for (let distance = 0; frontier.length > 0; distance += 1) {
		const names: string[] = [];
		const next: string[] = [];
		for (const id of frontier) {
			const revision = revisions.get(id);
			if (!revision) continue;
			names.push(...revision.bookmarks);
			for (const parent of revision.parents) {
				if (visited.has(parent)) continue;
				visited.add(parent);
				next.push(parent);
			}
		}
		const name = names.sort()[0];
		if (name !== undefined) return { name, distance };
		frontier = next;
	}
	return undefined;
}

export async function inspectJjWorkspace(
	options: InspectWorkspacePulseOptions,
): Promise<WorkspacePulseInspection> {
	const unavailable = { kind: "unavailable", vcs: "jj" } as const;
	const discovery = await options.exec("jj", [...JJ_READ_FLAGS, "root"], {
		cwd: options.cwd,
		timeout: JJ_TIMEOUT_MS,
	});
	if (discovery.code !== 0 || discovery.killed || options.signal?.aborted) return unavailable;
	const root = discovery.stdout.replace(/\r?\n$/, "");
	if (!root || !nodePath.isAbsolute(root)) return unavailable;

	// Only include paths from ancestor bookmarks to @, not the entire repository
	// history. With no ancestor bookmark, this still includes @ for the fallback ID.
	const log = await options.exec(
		"jj",
		[...JJ_READ_FLAGS, "log", "--no-graph", "-r", "@ | (bookmarks()::@)", "-T", JJ_LOG_TEMPLATE],
		{ cwd: root, timeout: JJ_TIMEOUT_MS },
	);
	if (log.code !== 0 || log.killed || options.signal?.aborted) return unavailable;
	const revisions = parseRevisions(log.stdout);
	const current = [...revisions.values()].find((revision) => revision.current);
	if (!current) return unavailable;
	const nearest = nearestBookmark(current, revisions);
	return {
		kind: "available",
		vcs: "jj",
		root,
		relativeCwd: toDisplayPath(nodePath.relative(root, options.cwd)),
		identity: {
			changeId: current.change,
			bookmarks: [...new Set(current.bookmarks)].sort(),
			...(current.description ? { description: current.description } : {}),
			...(nearest ? { nearestBookmark: nearest } : {}),
		},
	};
}
