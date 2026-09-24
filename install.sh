#!/usr/bin/env bash
set -e

LOG_DIR="$HOME/kubuntu-rebuild-logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/setup-$(date +%Y%m%d-%H%M%S).log"

exec > >(tee -a "$LOG_FILE") 2>&1

echo "Started at $(date) | Log: $LOG_FILE"

chmod +x base.sh dev-tools.sh security-tools.sh apps.sh

if [[ "$1" == "--all" ]]; then
    ./base.sh
    ./dev-tools.sh
    ./security-tools.sh
    ./apps.sh
else
    echo "Usage: ./install.sh --all"
    exit 1
fi

echo "All modules executed successfully!"
