#!/usr/bin/env bash
set -u
check() {
  if command -v "$1" >/dev/null 2>&1; then printf 'OK      %-20s %s\n' "$1" "$(command -v "$1")"
  else printf 'MISSING %-20s\n' "$1"; fi
}
for c in git curl wget jq rsync btop htop vim cmake python3 pipx node npm nmap wireshark tcpdump google-chrome code; do check "$c"; done
echo
dpkg-query -W -f='${binary:Package} ${Version}\n' git build-essential cmake python3 nodejs npm nmap wireshark google-chrome-stable code 2>/dev/null || true
