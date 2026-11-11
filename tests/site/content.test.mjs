// Tests for the machine-readable files and agent-facing pages in site/.
// Run with: node --test tests/site
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { join } from "node:path";
import { SITE, worker } from "./load-worker.mjs";

const ORIGIN = "https://tryfrankenstein.pages.dev";
const read = (rel) => readFileSync(join(SITE, rel), "utf8");
const { MARKDOWN_ROUTES } = worker;

// Map a public URL on our origin to the file Pages would serve for it.
function fileFor(url) {
  const path = new URL(url).pathname;
  if (path === "/") return "index.html";
  const rel = path.slice(1);
  return existsSync(join(SITE, rel)) ? rel : `${rel}.html`;
}

const visibleText = (html) =>
  html
    .replace(/<(script|style|svg)[\s\S]*?<\/\1>/g, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/&[a-z#0-9]+;/g, " ")
    .replace(/\s+/g, " ")
    .trim();

const jsonLd = (html) =>
  [...html.matchAll(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/g)].map((m) => JSON.parse(m[1]));

test("llms.txt follows the llmstxt.org layout", () => {
  const txt = read("llms.txt");
  const lines = txt.split("\n");
  assert.match(lines[0], /^# Frankenstein$/, "starts with a single H1 naming the project");
  const firstContent = lines.slice(1).find((l) => l.trim());
  assert.match(firstContent, /^> \S/, "the H1 is followed by a blockquote summary");
  assert.equal((txt.match(/^# /gm) || []).length, 1, "exactly one H1");
  for (const h of ["## When to use Frankenstein", "## How an agent should call it", "## Docs", "## Optional"]) {
    assert.ok(lines.includes(h), `has section ${h}`);
  }
  // In file-list sections every item is a Markdown link, optionally followed by ": notes".
  for (const section of ["## Docs", "## Source", "## Optional"]) {
    const start = lines.indexOf(section);
    const end = lines.findIndex((l, i) => i > start && l.startsWith("## "));
    const items = lines.slice(start + 1, end === -1 ? undefined : end).filter((l) => l.startsWith("- "));
    assert.ok(items.length > 0, `${section} lists links`);
    for (const item of items) assert.match(item, /^- \[[^\]]+\]\(https:\/\/[^)\s]+\)(: .+)?$/, item);
  }
});

test("llms.txt when-to-use section names concrete jobs and how to call the project", () => {
  const txt = read("llms.txt");
  const when = txt.split("## When to use Frankenstein")[1].split("\n## ")[0];
  assert.ok((when.match(/^- \*\*/gm) || []).length >= 4, "at least four specific use cases");
  assert.match(when, /Do not use Frankenstein/);
  const how = txt.split("## How an agent should call it")[1].split("\n## ")[0];
  assert.match(how, /POST http:\/\/127\.0\.0\.1:7101\/check/);
  assert.match(how, /POST \/jobs/);
  assert.match(how, /git clone https:\/\/github\.com\/KarthikSubramanian07\/Frankenstein\.git/);
});

test("every same-origin link in llms.txt resolves to a file in site/", () => {
  const links = [...read("llms.txt").matchAll(/\((https:\/\/tryfrankenstein\.pages\.dev[^)\s]*)\)/g)].map((m) => m[1]);
  assert.ok(links.length >= 5);
  for (const url of links) assert.ok(existsSync(join(SITE, fileFor(url))), `${url} -> ${fileFor(url)}`);
});

test("trust pages exist as HTML and Markdown with at least 500 characters of real content", () => {
  for (const slug of ["about", "contact", "privacy"]) {
    const html = read(`${slug}.html`);
    const main = html.split('<main id="main"')[1].split("</main>")[0];
    const text = visibleText(`<main${main}`);
    assert.ok(text.length >= 500, `${slug}.html main content is ${text.length} chars`);
    assert.match(html, new RegExp(`<link rel="canonical" href="${ORIGIN}/${slug}">`));
    assert.match(html, new RegExp(`<link rel="alternate" type="text/markdown" href="/${slug}.md"`));
    const md = read(`${slug}.md`);
    assert.ok(md.length >= 500, `${slug}.md is ${md.length} chars`);
    assert.match(md, /^# /);
    jsonLd(html); // parses
  }
});

test("pages link to the trust pages from their footers", () => {
  for (const page of ["index.html", "judges.html", "about.html", "contact.html", "privacy.html"]) {
    const html = read(page);
    for (const href of ["/about", "/contact", "/privacy", "/llms.txt"]) assert.ok(html.includes(`href="${href}"`), `${page} -> ${href}`);
  }
});

test("homepage Organization JSON-LD is complete", () => {
  const [ld] = jsonLd(read("index.html"));
  assert.equal(ld["@context"], "https://schema.org");
  const org = ld["@graph"].find((n) => n["@type"] === "Organization");
  assert.ok(org, "has an Organization node");
  assert.ok(org.name && org.description && org.description.length > 40);
  assert.equal(org.url, `${ORIGIN}/`);
  assert.ok(org.logo?.url?.startsWith(ORIGIN));
  assert.ok(existsSync(join(SITE, new URL(org.logo.url).pathname)), "logo file exists");
  assert.ok(Array.isArray(org.sameAs) && org.sameAs.length > 0);
  assert.equal(org.contactPoint["@type"], "ContactPoint");
  assert.ok(org.contactPoint.contactType);
  assert.ok(org.contactPoint.url || org.contactPoint.email || org.contactPoint.telephone);
  assert.equal(org.address["@type"], "PostalAddress");
  assert.ok(org.address.addressCountry && org.address.addressLocality);
  const code = ld["@graph"].find((n) => n["@type"] === "SoftwareSourceCode");
  assert.equal(code.creator["@id"], org["@id"], "the software points at the Organization");
  assert.match(code.keywords, /GBADoom/);
});

test("homepage keeps its HTML design and advertises the Markdown twin", () => {
  const html = read("index.html");
  assert.match(html, /<link rel="alternate" type="text\/markdown" href="\/index\.md"/);
  assert.match(html, /<h1 id="hero-h" class="display"/);
  assert.match(html, /<link rel="stylesheet" href="\/assets\/site\.css\?v=24">/);
});

test("Markdown twins carry the same published numbers as the HTML pages", () => {
  const md = read("index.md");
  const html = read("index.html");
  for (const n of ["235", "568", "8.39%", "39 lies caught", "32 fakes rejected"]) {
    assert.ok(md.includes(n), `index.md has ${n}`);
    assert.ok(html.includes(n), `index.html has ${n}`);
  }
  const judges = read("judges.md");
  for (const n of ["235 of", "568", "8.39%", "d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2"]) assert.ok(judges.includes(n), `judges.md has ${n}`);
});

test("sitemap lists every HTML route that has a Markdown twin, and robots.txt points at it", () => {
  const xml = read("sitemap.xml");
  const locs = [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1]);
  for (const route of Object.keys(MARKDOWN_ROUTES)) assert.ok(locs.includes(`${ORIGIN}${route}`), `sitemap has ${route}`);
  for (const loc of locs) assert.ok(existsSync(join(SITE, fileFor(loc))), `${loc} exists`);
  assert.match(read("robots.txt"), new RegExp(`Sitemap: ${ORIGIN}/sitemap.xml`));
});
