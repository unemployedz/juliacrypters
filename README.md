# juliacrypters – Snapchat IPA Patcher

Workflow that downloads a decrypted Snapchat IPA and injects a screenshot-detection bypass dylib.

## Features targeted
- Block screenshot & screen-recording detection (no notification on chats / friendship profiles)
- Clean injection ready for sideloading with Feather / Sideloadly / TrollStore

## Current status
- IPA download + re-pack works
- Screenshot bypass **source** is included in `dylib/`
- Real arm64 iOS dylib compilation requires Theos + iOS SDK (cannot be done on plain Ubuntu runner)

## How to get a working patched IPA (first-try path)

### Option 1 – Easiest (recommended right now)
1. Compile the dylib on a Mac with Theos (or use any existing SecretShot / Phantom-style dylib).
2. Host the resulting `SecretShot.dylib` somewhere with a direct link.
3. Run the workflow and paste the dylib URL.

### Option 2 – Compile yourself
```bash
# On a Mac with Theos installed
cd dylib
make package
# The .dylib will be inside the .deb or in .theos/obj
```

Then re-run the workflow with the dylib URL.

## Workflow inputs
- `ipa_url` – already filled with your Dropbox link
- `dylib_url` – direct link to a compiled arm64 `.dylib`

## Artifact
After a successful run you get `Snapchat-Patched.ipa` ready for Feather.

---
Source for the bypass is in `dylib/Tweak.x` (hooks `UIScreen isCaptured`).
