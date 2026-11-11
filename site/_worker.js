// Cloudflare Pages advanced-mode Worker for tryfrankenstein.pages.dev.
//
// Everything is still a static file in site/. This Worker only adds what a static host can't do on its own:
//   1. Markdown content negotiation (https://acceptmarkdown.com): a page requested with `Accept: text/markdown`
//      gets its Markdown twin (site/<page>.md) with `Content-Type: text/markdown` and `Vary: Accept`.
//      Browsers, which never ask for text/markdown, keep getting the same HTML as before.
//   2. Agent-friendly 404s: an unknown path still returns HTTP 404, and Markdown readers get a short
//      Markdown explanation with links to /llms.txt and /sitemap.xml instead of the HTML error page.
//   3. The security and cache headers from site/_headers on every response. Cloudflare does not apply
//      _headers to responses a Worker builds itself, so they are mirrored here (a test keeps the two in sync).

const ORIGIN = "https://tryfrankenstein.pages.dev";

// HTML route -> its Markdown twin. Keep in step with site/sitemap.xml and site/llms.txt.
export const MARKDOWN_ROUTES = {
  "/": "/index.md",
  "/judges": "/judges.md",
  "/about": "/about.md",
  "/contact": "/contact.md",
  "/privacy": "/privacy.md",
};

// Mirror of site/_headers, in file order. tests/site/worker.test.mjs fails if they drift apart.
export const HEADER_RULES = [
  {
    pattern: "/*",
    headers: {
      "X-Content-Type-Options": "nosniff",
      "X-Frame-Options": "DENY",
      "Referrer-Policy": "strict-origin-when-cross-origin",
      "Permissions-Policy": "camera=(), microphone=(), geolocation=(), payment=(), usb=()",
      "Strict-Transport-Security": "max-age=31536000; includeSubDomains",
      "Cross-Origin-Opener-Policy": "same-origin",
      "Content-Security-Policy":
        "default-src 'self'; script-src 'self' https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; img-src 'self' data:; connect-src 'self'; object-src 'none'; base-uri 'none'; form-action 'none'; frame-ancestors 'none'",
    },
  },
  { pattern: "/assets/*", headers: { "Cache-Control": "public, max-age=604800, stale-while-revalidate=86400" } },
  { pattern: "/og/*", headers: { "X-Robots-Tag": "noindex" } },
];

const MARKDOWN_TYPE = "text/markdown; charset=utf-8";

// Parse an Accept header into [{type, q}] (RFC 9110 section 12.5.1). Malformed entries are ignored.
export function parseAccept(header) {
  if (!header) return [];
  const out = [];
  for (const part of header.split(",")) {
    const [range, ...params] = part.trim().split(";");
    const type = range.trim().toLowerCase();
    if (!type || !type.includes("/")) continue;
    let q = 1;
    for (const p of params) {
      const [k, v] = p.split("=").map((s) => s && s.trim());
      if (k && k.toLowerCase() === "q") {
        const n = Number(v);
        q = Number.isFinite(n) ? Math.min(Math.max(n, 0), 1) : 0;
      }
    }
    out.push({ type, q });
  }
  return out;
}

// True when the client prefers Markdown over HTML. Markdown must be named explicitly (wildcards like */* or
// text/* never select it, so browsers and generic clients keep HTML), with a q at least as high as HTML's.
export function prefersMarkdown(header) {
  const ranges = parseAccept(header);
  let md = 0;
  let html = 0;
  let htmlSpecificity = -1;
  for (const { type, q } of ranges) {
    if (type === "text/markdown" || type === "text/x-markdown") md = Math.max(md, q);
    const spec = type === "text/html" ? 2 : type === "text/*" ? 1 : type === "*/*" ? 0 : -1;
    if (spec > htmlSpecificity) {
      htmlSpecificity = spec;
      html = q;
    } else if (spec === htmlSpecificity && spec >= 0) {
      html = Math.max(html, q);
    }
  }
  return md > 0 && md >= html;
}

function normalizePath(pathname) {
  if (pathname.length > 1 && pathname.endsWith("/")) pathname = pathname.replace(/\/+$/, "");
  if (pathname === "/index" || pathname === "/index.html") return "/";
  return pathname.endsWith(".html") ? pathname.slice(0, -5) : pathname;
}

function matches(pattern, pathname) {
  return pattern.endsWith("/*") ? pathname.startsWith(pattern.slice(0, -1)) : pathname === pattern;
}

// Set every _headers rule that matches, without overriding anything the response already carries.
export function applyHeaderRules(pathname, headers) {
  for (const rule of HEADER_RULES) {
    if (!matches(rule.pattern, pathname)) continue;
    for (const [k, v] of Object.entries(rule.headers)) if (!headers.has(k)) headers.set(k, v);
  }
  return headers;
}

function addVary(headers, value) {
  const current = headers.get("Vary");
  if (!current) return headers.set("Vary", value);
  const parts = current.split(",").map((s) => s.trim().toLowerCase());
  if (!parts.includes(value.toLowerCase()) && !parts.includes("*")) headers.set("Vary", `${current}, ${value}`);
}

function withHeaders(response, pathname, extra = {}) {
  const headers = new Headers(response.headers);
  for (const [k, v] of Object.entries(extra)) headers.set(k, v);
  applyHeaderRules(pathname, headers);
  return new Response(response.body, { status: response.status, statusText: response.statusText, headers });
}

export function notFoundMarkdown(pathname) {
  // Echo only a safe, short form of the path so the body can't be used to inject Markdown links.
  const shown = pathname.replace(/[^A-Za-z0-9/._~-]/g, "").slice(0, 120) || "/";
  return `# 404: page not found

There is no page at \`${shown}\` on tryfrankenstein.pages.dev. Its source code was lost, and the referee
found nothing byte-identical to put back.

Frankenstein is a video game preservation project: AI coding agents rebuild a game's lost C source from the
compiled game, one function at a time, and a compiler accepts only byte-identical code.

## Where to go instead

- [Home](${ORIGIN}/): what Frankenstein is and the current proof (Markdown: ${ORIGIN}/index.md)
- [llms.txt](${ORIGIN}/llms.txt): the agent guide, with when to use Frankenstein and how to call it
- [Sitemap](${ORIGIN}/sitemap.xml): every public page
- [Source on GitHub](https://github.com/KarthikSubramanian07/Frankenstein)
`;
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const isRead = request.method === "GET" || request.method === "HEAD";
    const path = normalizePath(url.pathname);
    const wantsMarkdown = isRead && prefersMarkdown(request.headers.get("Accept"));
    const twin = isRead ? MARKDOWN_ROUTES[path] : undefined;

    // A page with a Markdown twin, asked for in Markdown: serve the twin from the static assets.
    if (twin && wantsMarkdown) {
      const md = await env.ASSETS.fetch(new Request(new URL(twin, url), { method: request.method }));
      if (md.ok) {
        return withHeaders(md, url.pathname, {
          "Content-Type": MARKDOWN_TYPE,
          "Vary": "Accept",
          "Cache-Control": "public, max-age=0, must-revalidate",
          "Link": `<${ORIGIN}${path}>; rel="canonical"`,
          "Content-Location": twin,
        });
      }
    }

    const res = await env.ASSETS.fetch(request);

    // Unknown path, asked for in Markdown: keep the 404 status, answer in Markdown.
    if (res.status === 404 && wantsMarkdown) {
      const body = notFoundMarkdown(url.pathname);
      return withHeaders(new Response(request.method === "HEAD" ? null : body, { status: 404, statusText: "Not Found" }), url.pathname, {
        "Content-Type": MARKDOWN_TYPE,
        "Vary": "Accept",
        "Cache-Control": "no-store",
      });
    }

    const extra = {};
    if (url.pathname.endsWith(".md") && res.ok) {
      // Direct links to the twins (/index.md and friends). Point search engines at the HTML original.
      const html = Object.keys(MARKDOWN_ROUTES).find((k) => MARKDOWN_ROUTES[k] === url.pathname);
      extra["Content-Type"] = MARKDOWN_TYPE;
      if (html) extra["Link"] = `<${ORIGIN}${html}>; rel="canonical"`;
    }
    const out = withHeaders(res, url.pathname, extra);
    if (twin || res.status === 404) {
      addVary(out.headers, "Accept");
      if (twin && res.ok) out.headers.append("Link", `<${twin}>; rel="alternate"; type="text/markdown"`);
    }
    return out;
  },
};
