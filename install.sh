#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$HOME/kubuntu-rebuild-logs"
mkdir -p "$LOG_DIR"
LOG="$LOG_DIR/setup-$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$LOG") 2>&1

usage() { echo "Usage: ./install.sh [--all|--base|--dev|--security|--apps|--verify]"; }
[[ $# -eq 0 ]] && set -- --all
[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && { usage; exit 0; }
[[ $EUID -ne 0 ]] || { echo "Run as normal user, not sudo."; exit 1; }
command -v apt-get >/dev/null || { echo "Kubuntu/Ubuntu with apt is required."; exit 1; }

for arg in "$@"; do
  case "$arg" in --all|--base|--dev|--security|--apps|--verify) ;; *) usage; exit 2;; esac
done

echo "Started $(date) | Log: $LOG"
echo "No full OS upgrade, boot changes, security disabling, or file deletion."
sudo -v
(while true; do sudo -n true 2>/dev/null || exit; sleep 45; done) &
KEEPALIVE=$!
trap 'kill "$KEEPALIVE" 2>/dev/null || true' EXIT

run() { echo; echo "===== $1 ====="; bash "$ROOT/scripts/$1"; }
for arg in "$@"; do
 case "$arg" in
  --all) run base.sh; run dev-tools.sh; run security-tools.sh; run apps.sh; run verify.sh ;;
  --base) run base.sh ;;
  --dev) run dev-tools.sh ;;
  --security) run security-tools.sh ;;
  --apps) run apps.sh ;;
  --verify) run verify.sh ;;
 esac
done
echo "Finished $(date). Log: $LOG"
