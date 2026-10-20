import {
  MOONVEIL_TRIAL_ANALYSIS,
  MOONVEIL_TRIAL_SHA256,
  MOONVEIL_TRIAL_SOURCE_BYTES,
} from "./moonveil-trial-data.ts";

export const ENGINE_VERSION = "1.1";
export const MOONVEIL_TRIAL_CAPABILITY = Object.freeze({
  status: "experimental_known_sample",
  mode: "exact_input_analysis_cache",
  target: "autofarm-premium",
  obfuscator: "MoonVeil 2.0.24",
  source_sha256: MOONVEIL_TRIAL_SHA256,
  arbitrary_source_supported: false,
  source_reconstructed: false,
  charged: 0,
});

export type TrialAnalysis = {
  result: string;
  status: "partial_analysis";
  source_sha256: string;
  cache_match: "sha256_exact";
  source_reconstructed: false;
  executable_source: false;
  note: string;
};

export function lookupMoonveilTrial(sourceDigest: string): TrialAnalysis | null {
  if (sourceDigest !== MOONVEIL_TRIAL_SHA256) return null;
  return {
    result: MOONVEIL_TRIAL_ANALYSIS,
    status: "partial_analysis",
    source_sha256: MOONVEIL_TRIAL_SHA256,
    cache_match: "sha256_exact",
    source_reconstructed: false,
    executable_source: false,
    note: "PARTIAL / PERCOBAAN: analisis tersimpan untuk autofarm-premium yang cocok persis. Source asli utuh belum direkonstruksi. Kredit tidak dipotong.",
  };
}

export function moonveilCandidateSize(source: string): boolean {
  // No marker-only detection or approximate match can return another file's analysis.
  return source.length <= MOONVEIL_TRIAL_SOURCE_BYTES && source.length >= 100000;
}
