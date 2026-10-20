# ZYRIXEN Engine 1.0 — online static decoder + optional AI

This folder backs the existing Supabase function `zyrixen-api`. API endpoint, username sessions, maintenance, bans and credits remain unchanged; **Android APK v0.9 does not need reinstalling for static engine upgrades**.

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

Run `node zyrixen/backend/supabase/zyrixen-api/engine.test.mjs` on Node 24+, and `deno check zyrixen/backend/supabase/zyrixen-api/index.ts`. CI: `.github/workflows/zyrixen-engine-ci.yml`.

For every released version, test stable credit counting, no-transform no-charge, idempotent retries, owner bans, and workload limits on a disposable account without touching real users.
