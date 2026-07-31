---
name: get-md
description: Convert HTML, PDF, DOCX, and Markdown to clean, structured Markdown optimized for LLM consumption. Use when you need to extract and convert web content, documents, or files into machine-readable Markdown format.
allowed-tools:
  - Bash
  - Read
  - Write
  - Fetch_Content
---

# get-md Integration Skill

This skill enables Claude Code to effectively use `get-md` (by the Nano Collective) for converting HTML, PDF, DOCX, and Markdown files into clean, LLM-optimized Markdown.

## What is get-md?

`get-md` is a fast, lightweight (<100ms) converter that transforms various document formats into high-quality Markdown:

- **Formats**: HTML, PDF, DOCX, Markdown
- **Inputs**: Files, URLs, or stdin
- **Output**: Clean, structured Markdown with optional frontmatter metadata
- **Smart features**: Preserves Mermaid diagrams, handles tables/lists/links, extracts images
- **Optional LLM**: AI-powered conversion for complex or structured documents

Perfect for preparing web content, documentation, research materials, or PDFs for AI analysis.

## When to Use This Skill

### Ideal Use Cases

1. **Web Content Extraction**
   - Fetch and convert blog posts, articles, documentation
   - Strip HTML bloat, keep semantic structure
   - Extract key content from noisy pages

2. **Document Conversion**
   - PDF handbooks/reports → Markdown for analysis
   - DOCX documents → version-controllable Markdown
   - Preserve metadata in YAML frontmatter

3. **Content Preparation for Analysis**
   - Clean up documents before feeding to analysis tasks
   - Remove images/links/tables if not needed for context
   - Standardize format across multiple sources

4. **Batch Processing**
   - Convert multiple URLs or files at once
   - Crawl sitemaps for documentation sites
   - Parallel processing with configurable concurrency

5. **Diagram Preservation**
   - Keep Mermaid diagrams intact through conversion
   - Validate Mermaid syntax
   - Recover original diagram source from rendered SVG

### When NOT to Use

- Simple text extraction from files you already have as Markdown
- Images are critical to understanding the content
- Layout and visual design are more important than semantics
- Processing massive batches (better to script offline)

## Core Instructions

### 1. Verify Installation

```bash
getmd --version
# or
npx @nanocollective/get-md --version
```

### 2. Basic Command Patterns

```bash
# Convert a URL
getmd https://example.com -o output.md

# Convert a file (type auto-detected)
getmd document.pdf -o document.md
getmd page.html -o page.md
getmd notes.docx -o notes.md

# From stdin
cat article.html | getmd > article.md
```

### 3. Input Detection

getmd automatically detects input type:

| Input | Type |
|-------|------|
| `.pdf` file/URL or stdin with `%PDF` | PDF |
| `.docx` file/URL | DOCX |
| `.md`/`.markdown` file | Markdown |
| `http(s)://` URL, `.html`, or other | HTML |

### 4. Output Processing

Default output is stdout. Use `-o, --output <file>` to save to a file:

```bash
getmd https://example.com -o result.md
```

For JSON output (with stats):
```bash
getmd https://example.com --json
```

## Quick Reference Commands

### Basic Conversions

```bash
# Web page → Markdown
getmd https://blog.example.com/article -o article.md

# PDF → Markdown (text extracted + reconstructed)
getmd handbook.pdf -o handbook.md

# DOCX → Markdown
getmd report.docx -o report.md

# HTML file → Markdown
getmd page.html -o page.md

# Stdin to stdout
cat source.html | getmd > output.md
```

### Content Filtering

```bash
# Remove images (saves space, focus on text)
getmd https://example.com --no-images -o output.md

# Remove links (useful if only text matters)
getmd article.html --no-links -o output.md

# Remove tables (convert to prose)
getmd article.html --no-tables -o output.md

# Skip metadata frontmatter
getmd article.html --no-frontmatter -o output.md

# Disable Readability extraction (keep full HTML)
getmd article.html --no-extract -o output.md
```

### Advanced Options

```bash
# Set max output length (default: 1000000 chars)
getmd article.html --max-length 50000 -o output.md

# Validate Mermaid diagrams in output
getmd page.html --validate-mermaid -o output.md

# Download images locally and rewrite links
getmd article.html --download-images ./images -o output.md

# Use a custom config file
getmd article.html --config ./getmd.json -o output.md

# Verbose output (debugging)
getmd article.html -v -o output.md
```

### Network Options

```bash
# Retry failed requests up to N times (default: 2)
getmd https://example.com --retries 5 -o output.md

# Cache responses for 1 hour (default)
getmd https://example.com --cache -o output.md

# Use custom cache directory
getmd https://example.com --cache-dir ./my-cache -o output.md

# Set cache expiration (default: 3600 seconds)
getmd https://example.com --cache --cache-max-age 7200 -o output.md

# Resolve relative links from a base URL
getmd partial-page.html --base-url https://example.com -o output.md
```

### Batch Processing

```bash
# Convert multiple URLs from a file (one per line)
getmd --batch urls.txt --output-dir ./output

# Parallel conversions (default: 5)
getmd --batch urls.txt --concurrency 10

# Custom filename pattern: {host}, {path}, {slug}, {index}
getmd --batch urls.txt --name-pattern "{host}-{slug}.md"

# Generate a JSON manifest of results
getmd --batch urls.txt --manifest results.json

# Stop on first error
getmd --batch urls.txt --stop-on-error
```

### Sitemap Crawling

```bash
# Crawl and convert all URLs from a sitemap
getmd --sitemap https://docs.example.com/sitemap.xml

# Include/exclude URLs by glob pattern
getmd --sitemap https://docs.example.com/sitemap.xml \
  --include "api/**" \
  --exclude "**/deprecated"

# Limit depth of nested sitemap-index traversal (default: 3)
getmd --sitemap https://docs.example.com/sitemap.xml --max-depth 5

# Cap total URLs processed (default: 10000)
getmd --sitemap https://docs.example.com/sitemap.xml --max-urls 5000

# Combine with concurrency
getmd --sitemap https://docs.example.com/sitemap.xml \
  --concurrency 10 \
  --manifest crawler-results.json
```

### LLM-Powered Conversion (Optional)

```bash
# Check if model is installed
getmd --model-info

# Download the default model (one-time, ~1GB)
getmd --download-model

# Convert using LLM (requires model)
getmd https://example.com --use-llm -o output.md

# Specify LLM provider and model
getmd https://example.com --use-llm \
  --llm-provider openai-compatible \
  --llm-base-url https://localhost:8000 \
  --llm-model llama-2 -o output.md

# Compare standard vs LLM output
getmd article.html --compare -o comparison.md

# Show all configuration
getmd --show-config
```

## Common Workflows

### Workflow 1: Extract Blog Post for Analysis

```bash
# Fetch a blog post, clean output
getmd https://blog.example.com/analysis --no-images -o article.md

# Read result and analyze
cat article.md | grep -E "^#+|^-" # Extract structure
```

### Workflow 2: Convert PDF Documentation

```bash
# Convert PDF, preserve metadata in frontmatter
getmd technical-guide.pdf -o guide.md

# Extract frontmatter and content separately
head -20 guide.md  # See metadata
tail -n +20 guide.md | head -100  # See content preview
```

### Workflow 3: Batch Import Documentation

```bash
# Save list of doc URLs
cat > docs.txt << 'EOF'
https://docs.example.com/getting-started
https://docs.example.com/api/reference
https://docs.example.com/guides/advanced
EOF

# Convert all with parallel processing
getmd --batch docs.txt --concurrency 3 --output-dir ./docs

# Verify results
ls -la ./docs
```

### Workflow 4: Crawl Documentation Site

```bash
# Crawl entire sitemap, exclude deprecated pages
getmd --sitemap https://docs.example.com/sitemap.xml \
  --exclude "**/deprecated/**" \
  --concurrency 5 \
  --manifest site-docs.json \
  --output-dir ./exported-docs

# Check results
cat site-docs.json | jq '.[] | {url, status}'
```

## Error Handling

### Network Issues

- getmd automatically retries transient failures (5xx, 429, network errors)
- Use `--retries N` to increase attempts (default: 2)
- Use `--retry-delay N` to adjust backoff timing (default: 500ms, exponential + jitter)
- Use `--cache` to avoid re-fetching failed URLs

### Invalid Content

- If conversion fails, check `--verbose` output for details
- Use `--json` output to see error stats
- Verify input is accessible: `curl -I https://example.com/page`

### Large Documents

- Use `--max-length N` to truncate very large outputs
- Use `--no-images` to reduce file size
- Batch mode is more efficient than sequential processing

### Model/LLM Issues

- Verify installation: `getmd --model-info`
- Download if missing: `getmd --download-model`
- Check logs with `--verbose` during LLM conversion

## Integration Workflow

### Extract → Analyze → Use Pattern

```bash
# 1. Extract content
getmd https://docs.example.com/api --no-images -o api-docs.md

# 2. Verify output is clean
head -50 api-docs.md

# 3. Use in your task (pass to analysis, generate code, etc.)
# Now you can read and process the cleaned Markdown
```

## Configuration Files

Create a `getmd.json` or `.getmd.json` in your project root for persistent defaults:

```json
{
  "inputType": "html",
  "removeImages": false,
  "removeLinks": false,
  "removeTables": false,
  "maxLength": 100000,
  "llm": {
    "enabled": false,
    "provider": "local-llama"
  }
}
```

Then use with `--config`:
```bash
getmd article.html --config ./getmd.json -o output.md
```

## See Also

- [Full Documentation](https://docs.nanocollective.org/get-md/docs)
- [GitHub Repository](https://github.com/Nano-Collective/get-md)
- [Nano Collective](https://nanocollective.org)
