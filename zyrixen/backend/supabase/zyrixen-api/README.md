# ZYRIXEN Engine 1.1 — static decoder + exact-input MoonVeil analysis trial

This folder backs the existing Supabase function `zyrixen-api`. API endpoint, username sessions, maintenance, bans and credits remain unchanged; **Android APK v0.9 does not need reinstalling for static engine upgrades**.

## MoonVeil v5 trial in the existing APK

The online API now includes one **exact-input analysis cache** for the previously analyzed `autofarm-premium` MoonVeil 2.0.24 file. The original UTF-8 source must have SHA-256 `c3e05869385cf4c9378127ae51d287f0ffd590a0f67439e98f40c38f67a5c51a`. Even a changed newline is a cache miss. Other inputs continue through the existing static decoder.

This does **not** run the laptop's Python/Luau tool in Supabase, decode new MoonVeil files, or reconstruct executable source. It makes the existing analysis available through the phone's normal paste/file/raw-URL flow. `/health` and `/config` expose `moonveil_v5.mode = exact_input_analysis_cache` and `arbitrary_source_supported = false`.

On a match, the result starts with `PARTIAL / PERCOBAAN`, includes human-readable operation listings and captured-variable metadata, and explicitly says the original source is incomplete. The returned Lua is an analysis comment, not a playable game script. The existing v0.9 app can preview, copy and download this text; its engine label shows `1.1-PARTIAL`.

This read-only cache lookup requires a valid non-banned account and an enabled, non-maintenance service. It never calls the job billing RPC, records a completed deobfuscation job, or consumes AI quota. It returns `transformations: 0`, `charged: 0` and `result_status: partial_analysis`. Retries are free. Ordinary transformations retain the existing atomic credit and request-ID behavior.

`moonveil-trial-data.ts` is a generated, non-secret analysis artifact. Its hash match is the only route to that result; marker detection never selects another file's analysis.

## Implemented automatic static passes

- Decimal and hex Lua escapes in ordinary quoted strings, excluding comments and long strings
- Literal `string.char(72,101,...)` calls to byte-preserving Lua string literals
- Adjacent literal string concatenation
- Multi-pass chaining and obfuscator *indicators*, not claims of full devirtualization
- For sources over 350k characters, safe escape scanning only (bounded CPU and token memory)

The code **never executes source**, follows links, evaluates `loadstring`, or runs arbitrary VM payloads. Named obfuscators (Luraph, Moonveil, Centurion, etc.) are detected heuristically; their full VM layers are **not** decoded by this engine.

## AI analyzer (opt-in, restricted)

Gateway: Vercel AI Gateway's authenticated `/v1/chat/completions` API. The API key is stored in Supabase **function secrets**, not Android, Git or desktop files.

Configure these on Supabase's Edge Functions secrets UI:

- `AI_GATEWAY_API_KEY`: private API key from Vercel AI Gateway
- `ZYRIXEN_AI_MODEL`: a **verified** language model ID listed at https://ai-gateway.vercel.sh/v1/models, such as `alibaba/qwen3-coder-30b-a3b`
- `ZYRIXEN_AI_ENABLED=true`

AI is disabled by default until configured. Creating and using an AI Gateway key may have external usage costs; set a key-specific budget in Vercel before enabling. The app backend uses a **2-request-per-hour per-user quota**, 10,000-character input limit, 12-second timeout, and up to 650 output tokens. The AI is never supplied with Owner credentials. Untrusted Lua source is forwarded to the AI provider *only with an explicit `ai:true` request*.

Existing client API:
- `POST /deobfuscate` with `source` and UUID `request_id` returns `result`, `transformations`, `stages`, `patterns`, `warnings`, plus the existing credit response.
- Optional `ai:true` returns `ai.status` and advisory `ai.summary` if enabled, even when static transforms don't apply.

**Important:** Current v0.9 Android apps do not send `ai:true` and do not display `ai.summary`; this is a new API capability, not an AI UI installed on the phone. AI never replaces the executable `result` with a guessed script and never counts advice as a credit-charging transformation.

## Heavy worker integration — not yet deployed

The Python/Luau/Moonveil/Luraph tools on laptop Andess are independent local tools. They are *not* remotely invoked by Supabase. A future hardened cloud worker is needed for VM-heavy deobfuscation. Do not host arbitrary Lua execution inside the public Edge Function or rely on the laptop always being powered on.

## Verification

Run these on Node 24+, then type-check the entrypoint with Deno:

```sh
node zyrixen/backend/supabase/zyrixen-api/engine.test.mjs
node zyrixen/backend/supabase/zyrixen-api/moonveil-trial.test.mjs
node zyrixen/backend/supabase/zyrixen-api/route.test.mjs
deno check zyrixen/backend/supabase/zyrixen-api/index.ts
```

For the actual file-match, free-retry, and changed-source route cases, set `ZYRIXEN_MOONVEIL_FIXTURE` to a local copy of the original analyzed input when running the two trial tests. Test Lua is read as text and never executed. CI: `.github/workflows/zyrixen-engine-ci.yml`.

For every released version, test stable credit counting, no-transform no-charge, idempotent retries, owner bans, and workload limits on a disposable account without touching real users.
