// Tests for site/_worker.js: Markdown content negotiation, Markdown 404s and the mirrored _headers rules.
// Run with: node --test tests/site
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { join, extname } from "node:path";
import { SITE, worker } from "./load-worker.mjs";

const { default: handler, prefersMarkdown, parseAccept, MARKDOWN_ROUTES, HEADER_RULES, notFoundMarkdown } = worker;

const TYPES = { ".html": "text/html; charset=utf-8", ".md": "text/plain; charset=utf-8", ".txt": "text/plain; charset=utf-8", ".xml": "application/xml", ".css": "text/css" };

// A stand-in for the Pages asset server: pretty URLs, 404.html for anything missing.
const ASSETS = {
  calls: [],
  async fetch(input) {
    const req = input instanceof Request ? input : new Request(input);
    const { pathname } = new URL(req.url);
    this.calls.push(pathname);
    const candidates = pathname === "/" ? ["index.html"] : [pathname.slice(1), `${pathname.slice(1)}.html`];
    for (const rel of candidates) {
      const file = join(SITE, rel);
      if (rel && existsSync(file) && !rel.endsWith("/")) {
        const body = req.method === "HEAD" ? null : readFileSync(file);
        return new Response(body, { status: 200, headers: { "Content-Type": TYPES[extname(file)] || "application/octet-stream" } });
      }
    }
    return new Response(readFileSync(join(SITE, "404.html")), { status: 404, headers: { "Content-Type": TYPES[".html"] } });
  },
};

const get = (path, accept, method = "GET") =>
  handler.fetch(new Request(`https://tryfrankenstein.pages.dev${path}`, { method, headers: accept ? { Accept: accept } : {} }), { ASSETS });

const varyHasAccept = (res) => (res.headers.get("Vary") || "").toLowerCase().split(",").map((s) => s.trim()).includes("accept");

test("parseAccept reads media ranges and q-values", () => {
  assert.deepEqual(parseAccept("text/markdown;q=0.8, text/html"), [
    { type: "text/markdown", q: 0.8 },
    { type: "text/html", q: 1 },
  ]);
  assert.deepEqual(parseAccept(""), []);
  assert.deepEqual(parseAccept("garbage, */*;q=bad"), [{ type: "*/*", q: 0 }]);
});

test("prefersMarkdown only when text/markdown is named and not outranked by HTML", () => {
  assert.equal(prefersMarkdown("text/markdown"), true);
  assert.equal(prefersMarkdown("text/markdown, text/html;q=0.9"), true);
  assert.equal(prefersMarkdown("text/markdown, text/html"), true);
  assert.equal(prefersMarkdown("text/x-markdown"), true);
  assert.equal(prefersMarkdown("text/markdown;q=0.5, text/html"), false);
  assert.equal(prefersMarkdown("text/markdown;q=0"), false);
  assert.equal(prefersMarkdown("text/html"), false);
  assert.equal(prefersMarkdown("*/*"), false);
  assert.equal(prefersMarkdown("text/*"), false);
  assert.equal(prefersMarkdown(null), false);
  // A real browser Accept header keeps getting HTML.
  assert.equal(prefersMarkdown("text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"), false);
});

test("homepage with Accept: text/markdown returns the Markdown twin with Vary: Accept", async () => {
  const res = await get("/", "text/markdown");
  assert.equal(res.status, 200);
  assert.match(res.headers.get("Content-Type"), /^text\/markdown/);
  assert.ok(varyHasAccept(res));
  const body = await res.text();
  assert.ok(body.startsWith("# Frankenstein"), "body is the Markdown twin");
  assert.equal(body, readFileSync(join(SITE, "index.md"), "utf8"));
  assert.match(res.headers.get("Link"), /rel="canonical"/);
});

test("homepage with Accept: text/html still returns the unchanged HTML, with Vary: Accept", async () => {
  const res = await get("/", "text/html");
  assert.equal(res.status, 200);
  assert.match(res.headers.get("Content-Type"), /^text\/html/);
  assert.ok(varyHasAccept(res));
  assert.equal(await res.text(), readFileSync(join(SITE, "index.html"), "utf8"));
  assert.match(res.headers.get("Link"), /<\/index\.md>; rel="alternate"; type="text\/markdown"/);
});

test("no Accept header and browser Accept headers get HTML", async () => {
  for (const accept of [undefined, "*/*", "text/html,application/xhtml+xml,*/*;q=0.8"]) {
    const res = await get("/", accept);
    assert.match(res.headers.get("Content-Type"), /^text\/html/, `Accept: ${accept}`);
  }
});

test("every Markdown route negotiates, including trailing-slash and .html spellings", async () => {
  for (const [route, twin] of Object.entries(MARKDOWN_ROUTES)) {
    assert.ok(existsSync(join(SITE, twin.slice(1))), `${twin} exists`);
    assert.ok(route === "/" || existsSync(join(SITE, `${route.slice(1)}.html`)), `${route}.html exists`);
    const res = await get(route, "text/markdown");
    assert.equal(res.status, 200, route);
    assert.match(res.headers.get("Content-Type"), /^text\/markdown/, route);
    assert.ok(varyHasAccept(res), route);
  }
  const slash = await get("/about/", "text/markdown");
  assert.match(slash.headers.get("Content-Type"), /^text\/markdown/);
});

test("HEAD with Accept: text/markdown returns Markdown headers and no body", async () => {
  const res = await get("/", "text/markdown", "HEAD");
  assert.equal(res.status, 200);
  assert.match(res.headers.get("Content-Type"), /^text\/markdown/);
  assert.equal(await res.text(), "");
});

test("unknown path with Accept: text/markdown keeps 404 and returns a Markdown body with links", async () => {
  const res = await get("/__ora-404-probe-cawjsh3t", "text/markdown");
  assert.equal(res.status, 404);
  assert.match(res.headers.get("Content-Type"), /^text\/markdown/);
  assert.ok(varyHasAccept(res));
  const body = await res.text();
  assert.ok(body.length >= 20);
  assert.match(body, /^# 404/);
  assert.match(body, /https:\/\/tryfrankenstein\.pages\.dev\/llms\.txt/);
  assert.match(body, /https:\/\/tryfrankenstein\.pages\.dev\/sitemap\.xml/);
});

test("unknown path for browsers keeps the HTML 404 page", async () => {
  const res = await get("/__nope", "text/html");
  assert.equal(res.status, 404);
  assert.match(res.headers.get("Content-Type"), /^text\/html/);
  assert.ok(varyHasAccept(res));
  assert.match(await res.text(), /source code <em>was lost/);
});

test("the 404 Markdown never echoes characters that could inject links or markup", () => {
  const md = notFoundMarkdown("/[x](https://evil.example)<script>`");
  assert.ok(!md.includes("evil.example)"));
  assert.ok(!md.includes("<script>"));
  assert.match(md, /`\/xhttps\/\/evil\.examplescript`/);
});

test("direct .md URLs are served as text/markdown with a canonical link to the HTML page", async () => {
  const res = await get("/index.md", "*/*");
  assert.equal(res.status, 200);
  assert.match(res.headers.get("Content-Type"), /^text\/markdown/);
  assert.equal(res.headers.get("Link"), '<https://tryfrankenstein.pages.dev/>; rel="canonical"');
});

test("non-page assets pass through untouched by negotiation", async () => {
  const res = await get("/robots.txt", "text/markdown");
  assert.equal(res.status, 200);
  assert.match(res.headers.get("Content-Type"), /^text\/plain/);
  const css = await get("/assets/site.css", "text/markdown");
  assert.match(css.headers.get("Content-Type"), /^text\/css/);
  assert.equal(css.headers.get("Cache-Control"), "public, max-age=604800, stale-while-revalidate=86400");
});

test("POST is never negotiated", async () => {
  const res = await get("/", "text/markdown", "POST");
  assert.doesNotMatch(res.headers.get("Content-Type") || "", /markdown/);
});

test("every response, including Worker-built ones, carries the site security headers", async () => {
  const global = HEADER_RULES.find((r) => r.pattern === "/*").headers;
  for (const [path, accept] of [["/", "text/markdown"], ["/__nope", "text/markdown"], ["/", "text/html"], ["/index.md", "*/*"]]) {
    const res = await get(path, accept);
    for (const [k, v] of Object.entries(global)) assert.equal(res.headers.get(k), v, `${path} ${k}`);
  }
});

// Parse site/_headers into the same shape as HEADER_RULES.
function parseHeadersFile(text) {
  const rules = [];
  for (const raw of text.split("\n")) {
    if (!raw.trim() || raw.trim().startsWith("#")) continue;
    if (!/^\s/.test(raw)) rules.push({ pattern: raw.trim(), headers: {} });
    else {
      const i = raw.indexOf(":");
      rules.at(-1).headers[raw.slice(0, i).trim()] = raw.slice(i + 1).trim();
    }
  }
  return rules;
}

test("HEADER_RULES mirrors site/_headers exactly", () => {
  assert.deepEqual(HEADER_RULES, parseHeadersFile(readFileSync(join(SITE, "_headers"), "utf8")));
});
