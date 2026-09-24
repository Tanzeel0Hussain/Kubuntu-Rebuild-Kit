# Kubuntu-Rebuild-Kit

Repeatable setup kit for rebuilding Tanzeel's Kubuntu cybersecurity/development workstation after a fresh installation.

## One-command full setup

On fresh Kubuntu with working internet, open Konsole:

```bash
git clone https://github.com/Tanzeel0Hussain/Kubuntu-Rebuild-Kit.git
cd Kubuntu-Rebuild-Kit
chmod +x install.sh
./install.sh --all
```

Enter your sudo password when asked. The installer runs in the foreground; you can leave it running and return later. Keep the laptop plugged in, lid open, and don't shut down/restart until it finishes. Logs are saved in `~/kubuntu-rebuild-logs/`.

## Individual setup commands

Run from inside the repository:

```bash
./install.sh --base       # common utilities
./install.sh --dev        # development tools
./install.sh --security   # network/security tools
./install.sh --apps       # Chrome + VS Code
./install.sh --verify     # check installation status
```

Rerunning is supported. It does not run a full OS upgrade, change GRUB/PAM/KWallet, disable security features, delete files, or install Docker.

## Included software

- Base: Git, curl, wget, CA certificates, GnuPG, jq, rsync, unzip, p7zip, htop, btop, vim, net-tools
- Development: build-essential, CMake, Python 3 + venv/pip, pipx, Node.js/npm; OpenJDK 21 if available
- Security: Nmap, Wireshark, tcpdump, traceroute
- Apps: Google Chrome Stable and Visual Studio Code from official vendor endpoints

Package availability varies by Kubuntu release; check the log for skips/errors.

## Not automatically restored

This is a software setup kit—not a full-system image or personal-data recovery tool.

- VMware Workstation Pro and Windows VM at `/home/unknown/vmware/My Window`
- Antigravity IDE archive/launcher
- Proton VPN login/session
- rclone/OneDrive credentials and tokens
- Browser profiles, cookies, passkeys, Windows Hello PIN, SSH keys, GitHub tokens
- Custom KDE, hibernate/swap, GRUB, Wi-Fi and KWallet settings
- Docker (previously removed)

Back up the **entire powered-off VMware VM folder**, including `.vmx`, `.vmdk`, NVRAM and vTPM state. Store its encryption password separately. Do not assume package installation restores sessions or credentials.

## Safety

Uses Ubuntu repositories, Google's Chrome download endpoint, and Microsoft's VS Code repository. No remote shell scripts are piped directly into a shell. No personal files or boot/security settings are changed. Review `scripts/` before running if desired.

## Troubleshooting

- Fix Wi-Fi before running; internet is required.
- If apt is busy, wait for Discover/PackageKit to finish, then rerun.
- If interrupted, rerun the same command.
- Chrome/VS Code download errors can be retried later; check the log.

MIT License.
