# Zyrixen Android Suite

Two native Android apps and a FastAPI backend.

- `deob`: Zyrixen Deobfuscator
- `owner`: Zyrixen Owner
- `backend`: FastAPI control and basic static Lua string decoder

Build the debug APKs on GitHub Actions from `Build Zyrixen APKs`. This project is an early functional prototype, **not a verified release**. The APKs require a separately deployed HTTPS backend.

Security: set a strong `ZYRIXEN_ADMIN_TOKEN` on the backend. Never put it in a GitHub commit. The APK's Owner interface must be configured manually with that token.

The decoder handles select Lua string escapes; it does not yet handle VM-based obfuscation, Luraph or encrypted payloads. Use only scripts you're authorized to analyze.
