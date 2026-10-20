import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { createHash } from "node:crypto";
import { lookupMoonveilTrial, MOONVEIL_TRIAL_CAPABILITY, moonveilCandidateSize } from "./moonveil-trial.ts";

const known = MOONVEIL_TRIAL_CAPABILITY.source_sha256;
const hit = lookupMoonveilTrial(known);
assert.equal(hit.status, "partial_analysis");
assert.equal(hit.source_reconstructed, false);
assert.equal(hit.executable_source, false);
assert.equal(hit.cache_match, "sha256_exact");
assert.ok(hit.result.startsWith("-- deobsefactor by zyrixen\n-- PARTIAL / PERCOBAAN"));
assert.ok(hit.result.includes("BUKAN source asli utuh"));
assert.ok(hit.result.includes("captureRegister("));
assert.ok(hit.result.includes("BELUM DIREKONSTRUKSI"));
assert.ok(hit.result.endsWith("]========]\n"));
assert.equal(hit.result.indexOf("]========]"), hit.result.lastIndexOf("]========]"));
assert.equal(MOONVEIL_TRIAL_CAPABILITY.arbitrary_source_supported, false);
assert.equal(lookupMoonveilTrial("0".repeat(64)), null);
assert.equal(lookupMoonveilTrial(known.slice(0,-1)+"0"), null);
assert.equal(lookupMoonveilTrial("MoonVeil 2.0.24"), null);
assert.equal(moonveilCandidateSize("-- MoonVeil 2.0.24\nprint(1)"), false);

if (process.env.ZYRIXEN_MOONVEIL_FIXTURE) {
  const source = await readFile(process.env.ZYRIXEN_MOONVEIL_FIXTURE, "utf8");
  const digest = value => createHash("sha256").update(value).digest("hex");
  assert.equal(digest(source), known);
  assert.equal(moonveilCandidateSize(source), true);
  assert.equal(lookupMoonveilTrial(digest(source)).status, "partial_analysis");
  assert.equal(lookupMoonveilTrial(digest(source+"\n")), null);
  assert.equal(lookupMoonveilTrial(digest(source.replace("2.0.24", "2.0.25"))), null);
  console.log("PASS actual MoonVeil fixture and changed-file rejection");
}
console.log("PASS exact-input cache, analysis labels and non-executable report");
