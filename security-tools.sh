#!/usr/bin/env bash
set -Eeuo pipefail
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y nmap wireshark tcpdump traceroute
echo "Packet-capture permissions depend on local Wireshark configuration; avoid broad privileges."
