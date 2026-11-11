// Load site/_worker.js as an ES module. Cloudflare always treats _worker.js as a module, but Node only does when
// a package.json says so, and a package.json in site/ would be published with the site. The Worker has no
// imports, so evaluating its source from a data: URL is equivalent.
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";

export const SITE = join(dirname(fileURLToPath(import.meta.url)), "..", "..", "site");
const src = readFileSync(join(SITE, "_worker.js"), "utf8");
export const worker = await import(`data:text/javascript;base64,${Buffer.from(src).toString("base64")}`);
