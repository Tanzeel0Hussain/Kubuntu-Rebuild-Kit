#!/usr/bin/env bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "===== dev-tools.sh ====="

sudo apt update
sudo apt install -y \
  build-essential \
  cmake \
  python3 \
  python3-pip \
  python3-venv \
  pipx \
  nodejs \
  npm \
  openjdk-21-jdk

# Ensure pipx path without failing execution
pipx ensurepath --force || true

echo "dev-tools.sh finished successfully!"
