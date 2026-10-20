# ZYRIXEN Android Suite — v0.9

Existing Android applications:
- `deob/`: ZYRIXEN DEOBFUSCATOR. One-time username signup; online Lua transformations; credits and bans from Supabase; paste / URL / file; copy or save full Lua.
- `owner/`: ZYRIXEN OWNER. One-time owner activation and encrypted device session; users, credit adjustments, unlimited, bans, config and stats.
- `backend/supabase/zyrixen-api/index.ts`: source of the deployed Supabase Edge Function `zyrixen-api`.
- `backend/sql/credit_idempotency_v09.sql`: database migration already applied to the live Supabase instance.
- `backend/`: older FastAPI prototype, retained for history and tests (not the Android production API).

API endpoint is built into both apps. Owner tokens are never embedded in APKs. Production Supabase Edge Function has separate explicit token authorization.

## Build

GitHub Actions workflow: `.github/workflows/zyrixen-apk.yml`.

Every build produces debug APK artifacts for Android 16 installation smoke tests. For durable install/update-compatible **release** APKs, set these **GitHub Actions repository secrets**:

- `ZYRIXEN_KEYSTORE_B64`: base64-encoded existing dedicated release keystore (without line breaks).
- `ZYRIXEN_SIGNING_STORE_PASSWORD`: the keystore password.
- `ZYRIXEN_SIGNING_KEY_ALIAS`: the alias for the app signing key.
- `ZYRIXEN_SIGNING_KEY_PASSWORD`: the key password.

Use the **same** keystore, alias and passwords for all later versions. Once configured, the workflow generates a `Zyrixen-v0.9-Signed-APKs` artifact with:
- `Zyrixen_Deobfuscator_v0.9.apk`
- `Zyrixen_Owner_v0.9.apk`

Never commit the keystore or passwords to Git. Back up the original signing keystore securely outside GitHub.

**Update migration note:** APKs signed with a new permanent key cannot be installed as an update over an old APK that uses a different debug key, even if application ID and versionCode are correct. An existing Owner device's encrypted session survives normal same-signature updates, but not an uninstall/reinstall. A one-time signature migration may require reactivation and must be planned before uninstalling.

## Backend credit safety

Successful jobs, including 0-change results, store a unique `request_id`; retries with matching source fingerprints are not billed twice. Each successful non-unlimited transformation charges exactly one credit via an atomic DB transaction. Unlimited accounts and no-transform jobs charge zero. Clients keep pending request IDs across network retries.

## Scope

This is a reliability update. Heavy/VM-based deobfuscator engine work is intentionally deferred. Android emulator smoke tests are necessary but do not replace interactive testing of Owner, credits and device upgrades.
