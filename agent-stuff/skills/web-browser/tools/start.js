#!/usr/bin/env node

import { spawn, execSync } from "node:child_process";
import puppeteer from "puppeteer-core";

if (process.argv[2]) {
  console.log("Usage: start.ts");
  console.log("\nExamples:");
  console.log("  start.ts            # Start with fresh profile");
  process.exit(1);
}

// Setup profile directory
execSync("mkdir -p ~/.cache/scraping", { stdio: "ignore" });

// Start Chrome in background (detached so Node can exit)
spawn(
  "google-chrome",
  [
    "--remote-debugging-port=9222",
    `--user-data-dir=${process.env["HOME"]}/.cache/scraping`,
  ],
  { detached: true, stdio: "ignore" },
).unref();

// Wait for Chrome to be ready by attempting to connect
let connected = false;
for (let i = 0; i < 30; i++) {
  try {
    const browser = await puppeteer.connect({
      browserURL: "http://localhost:9222",
      defaultViewport: null,
    });
    await browser.disconnect();
    connected = true;
    break;
  } catch {
    await new Promise((r) => setTimeout(r, 500));
  }
}

if (!connected) {
  console.error("✗ Failed to connect to Chrome");
  process.exit(1);
}

console.log(
  `✓ Chrome started on :9222`,
);
