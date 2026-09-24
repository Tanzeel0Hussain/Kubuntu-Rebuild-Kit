#!/usr/bin/env bash
set -Eeuo pipefail
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 python3-pip python3-venv pipx nodejs npm
if apt-cache show openjdk-21-jdk >/dev/null 2>&1; then
  sudo apt-get install -y openjdk-21-jdk
else
  echo "OpenJDK 21 unavailable in enabled repositories; skipping."
fi
pipx ensurepath || true
