#!/usr/bin/env bash
set -Eeuo pipefail
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y git curl wget ca-certificates gnupg jq rsync unzip p7zip-full htop btop vim net-tools software-properties-common apt-transport-https
