# Cwrdd

Cwrdd (Welsh for "meet") is Stori Cymru's own scheduling app – the booking pages at https://cwrdd.stori.cymru. It is the open-source scheduler
[Cal.diy](https://github.com/calcom/cal.diy) (MIT licence) with our name, logo and house rules applied.

This repository holds only **our changes and the build recipe** – not Cal.diy itself.

| File | What it is |
|---|---|
| `patches/stori-branding.patch` | The source changes: our logos, 24-hour times only (no 12h/24h switch), and the name settings |
| `brand/` | Logo and icon files copied into the app |
| `apply-branding.sh` | Applies the patch and copies the brand files into a Cal.diy checkout |
| `CAL_REF` | The Cal.diy commit we build from |
| `.github/workflows/build.yml` | Builds the finished image on GitHub and stores it in this repository's packages |

**To make a new build:** push a tag named `build-<date>` (for example `build-2026-11-26`); GitHub builds the image and
stores it as `ghcr.io/storicymru/cwrdd:<date>`. To move to a newer Cal.diy, put its commit in the `CAL_REF` file first.
If the patch no longer fits, the build stops at "Apply Stori Cymru branding" and the patch needs updating.

The running copy lives on the NAS (`/share/Container/meet`). No passwords or keys are kept here.
