# Zyrixen CTN/Centurion fingerprint and recovery checkpoint

Target: Dameungrhub/Vvip, "Dameungrhub Whitelist"
Original GitHub blob SHA: 9fe4f35c0d6730cba2077156a151ae59d2a62263
Fingerprint: `CTN: decompression error`, `buffer.fromstring`, `loadstring(...,"Centurion")`, two long custom-base85 literals.
Classification: multi-layer Centurion flattening; not proven VM devirtualization.
Layer 1: recover packed blob via custom alphabet base85; 1-byte type flag + 4-byte little-endian payload length, then range-coded LZMA-style decompressor. Output 168950 characters Luau. Verified by comparing to earlier isolated Docker capture.
Layer 2: separate 87504-character literal transformed to 70003 bytes with its custom base85 table decoder. Constants: UI=bit32.bxor, pU=bit32.bor, A=bit32.band; immutable top-level aliases yn=1 E=2 am=3 G=4 g=5 etc. Iterative expression evaluator recovered 143 Q constants; direct string.char + xor resolved 39 strings; 44 dispatcher offset expressions simplified.
Artifacts (branch zyrixen-dameungrhub-recovery):
- Dameungrhub_Whitelist_LAYER1_deobsefactor_by_zyrixen.lua
- Dameungrhub_Whitelist_LAYER2_deobsefactor_by_zyrixen.lua
Validation: static payload decode succeeds to the expected length. Layer2 was not compiled nor differentially tested under Luau. Remaining: full CFG reconstruction, branch reassembly, function naming, Roblox runtime parity. Avoid claims of full recovery.
Runtime strategy: only use isolated Docker, no network, non-root if available, bounded CPU/memory and no secrets, intercept loadstring; do not execute untrusted protected payload in production.

Layer3 checkpoint (2026-10-31): `Dameungrhub_Whitelist_deobsefactor_by_zyrixen.lua`. Repaired 44 malformed numeric-token merges in Layer2 plus 2 new ones after jump folding. Recovered jump bytes y[57545]=45 and y[43239]=69; renamed 3 uses of `pE` to `decodeBase85`. Balanced delimiter and quote check passes (not a formal Luau parser). 281 state comparison sites remain, flattened VM not reconstructed. Saved in GitHub branch; current file is partial and not runtime-tested.
