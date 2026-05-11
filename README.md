# CyberOS

CyberOS is a zero-hassle, fully loaded VNC-powered Linux distribution optimized for serious bug bounty hunting, penetration testing, and heavy-duty recon. It ships out-of-the-box with a custom-themed XFCE desktop environment and an extensive arsenal of industry-standard tools.

Built for security professionals and students, CyberOS completely removes the headache of setting up a remote GUI environment and installing toolchains so you can focus entirely on the target.

## 🚀 Features

- **Instant VNC Setup:** Launch a fully functional XFCE desktop accessible via VNC on any port of your choosing.
- **Custom Cyberpunk Aesthetic:** Ships with a custom hacker-themed wallpaper and beautifully configured XFCE desktop to keep you in the zone.
- **The Ultimate Security Arsenal:** Pre-configured with a massive suite of tools including:
  - **Web Exploitation:** Burp Suite, SQLmap, Wfuzz
  - **Recon & Enumeration:** Nmap, Gobuster, Dirb
  - **Networking:** Wireshark, Net-tools
  - **Brute Forcing:** Hydra, John the Ripper, SecLists
  - **Daily Drivers:** Firefox (proxied), Tmux, Git
- **Lightweight & Fast:** Minimal overhead, optimized for performance on remote VPS instances or local VMs.
- **Auto-Updating:** Every time you launch CyberOS, it automatically syncs with the latest repository updates so you're never running stale configurations.

## 📦 Installation

To get the environment cloned and the massive dependency list installed automatically:

```bash
git clone https://github.com/DXN1-termux/CyberOS.git
cd CyberOS
chmod +x setup.sh CyberOS
./setup.sh
```

*(Note: Ensure you have `sudo` privileges to install the core OS packages.)*

## ⚡ Usage

To start your bug hunting environment, just run the launcher script and provide a port number:

```bash
./CyberOS 5901
```

Boom. It launches on that port. Open any VNC Viewer (or web VNC client) and connect to your machine's IP on the port specified.

---
*Disclaimer: CyberOS is built for educational and authorized security testing only.*
