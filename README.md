# juliacrypters – Snapchat IPA Patcher

GitHub Actions workflow to download a large Snapchat IPA from Dropbox (or any direct link), inject a screenshot-bypass dylib, and produce a patched IPA as an artifact.

## How to use

1. Upload your original Snapchat IPA to Dropbox.
2. Get a **direct download link** (must end with `?dl=1` or be a raw binary URL).
3. Go to the **Actions** tab → **Patch Snapchat IPA** → **Run workflow**.
4. Paste the IPA URL.
5. (Optional) Paste a direct URL to a compiled screenshot-bypass `.dylib` (SecretShot / Phantom style).
6. Run the workflow. When it finishes, download the `Snapchat-Patched` artifact.

## Notes

- The workflow only injects the dylib if you provide a `dylib_url`.
- For the features you wanted (no screenshot notification on chats/profiles + local outfit unlocks) you still need a proper dylib that implements those hooks.
- Large IPAs are fine – the workflow downloads them on the runner instead of storing them in the repo.

## Next steps

- Provide the Dropbox link for the IPA.
- Provide (or we can build) the screenshot-bypass + unlock dylib.
