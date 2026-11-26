#!/bin/sh
# Turns a checkout of Cal.diy into "Stori Cymru Meeting". Run from this folder: sh apply-branding.sh <path to cal.diy>
# Fails loudly if Cal.diy has changed so much that the patch no longer fits – then the patch needs redoing by hand.
set -eu
CAL="$1"; HERE="$(cd "$(dirname "$0")" && pwd)"
git -C "$CAL" apply "$HERE/patches/stori-branding.patch"
P="$CAL/apps/web/public"
cp "$HERE/brand/logo-white.png" "$P/stori-logo-white.png"
cp "$HERE/brand/logo-red.png" "$P/stori-logo-red.png"
cp "$HERE/brand/icon-192.png" "$P/stori-icon.png"
cp "$HERE/brand/favicon.ico" "$P/favicon.ico"
cp "$HERE/brand/apple-touch-icon.png" "$P/apple-touch-icon.png"
cp "$HERE/brand/icon-64.png" "$P/favicon-16x16.png"
cp "$HERE/brand/icon-64.png" "$P/favicon-32x32.png"
for n in 192x192 256x256 384x384; do cp "$HERE/brand/icon-192.png" "$P/android-chrome-$n.png"; done
cp "$HERE/brand/icon-512.png" "$P/android-chrome-512x512.png"
echo "Stori Cymru branding applied to $CAL"
