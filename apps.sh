#!/usr/bin/env bash
set -Eeuo pipefail
export DEBIAN_FRONTEND=noninteractive
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading Chrome Stable from Google..."
if curl -fL --retry 3 --connect-timeout 20 -o "$TMP/chrome.deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; then
  sudo apt-get install -y "$TMP/chrome.deb"
else
  echo "Chrome download failed; skipping."
fi

echo "Setting up Microsoft's official VS Code repository..."
if curl -fL --retry 3 --connect-timeout 20 -o "$TMP/msrepo.deb" https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb; then
  sudo apt-get install -y "$TMP/msrepo.deb"
  sudo apt-get update
  sudo apt-get install -y code
else
  echo "VS Code repository bootstrap failed; skipping."
fi
