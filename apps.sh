#!/usr/bin/env bash
set -e

echo "===== apps.sh ====="

echo "Downloading Chrome Stable from Google..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb
sudo apt update
sudo apt install -y /tmp/chrome.deb
rm -f /tmp/chrome.deb

echo "Setting up Microsoft's official VS Code repository..."
sudo apt update
sudo apt install -y wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install -y code

echo "apps.sh finished successfully!"
