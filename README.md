<h1 align="center">CyberOS</h1>
<p align="center">
  <b>MADE WITH ❤️ BY DXN1</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Version-0.42.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/Platform-Termux-brightgreen.svg" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License">
  <img src="https://img.shields.io/badge/Status-Stable-brightgreen.svg" alt="Status">
</p>

---

## 📖 Overview
**CyberOS** is a specialized, zero-hassle, VNC-powered Linux distribution. Engineered specifically for security professionals, bug bounty hunters, and ethical hackers, it provides a pre-configured, hardened environment that bridges the gap between mobile flexibility and desktop power.

CyberOS eliminates the tedious configuration of remote GUIs, security toolchains, and desktop environments, allowing you to focus entirely on your target.

---

## 🚀 The Ultimate Security Arsenal
CyberOS comes equipped with a massive suite of industry-standard tools (approaching 1GB in tool packages), organized for immediate deployment:

- **Recon & Discovery:** `nmap`, `masscan`, `subfinder`, `assetfinder`, `gospider`, `dnsrecon`.
- **Web Application Exploitation:** `burpsuite`, `zaproxy`, `sqlmap`, `ffuf`, `feroxbuster`, `gobuster`, `dirb`, `nikto`.
- **Networking & Traffic:** `wireshark`, `net-tools`.
- **Brute Forcing & Password Cracking:** `hydra`, `john`, `hashcat`.
- **Infrastructure Hacking:** `metasploit-framework`, `enum4linux`, `smbmap`, `ldapsearch`.
- **General Utilities:** `tmux`, `git`, `firefox`, `gimp`.

---

## ⚡ Features
- **Instant VNC:** Launch a functional, persistent XFCE desktop on any port.
- **Universal Compatibility:** Designed to work flawlessly with every VNC viewer and terminal emulator.
- **Optimized Performance:** Performance tweaks including disabled desktop compositing and visual effects.
- **Modular Utility Library:** A backend library (`lib/utils.sh`) provides shared, reliable logic for logging and dependency validation across all system scripts.
- **Setup Wizard:** An interactive command-line wizard (`wizard.sh`) handles installation and environment health checks.
- **Cyberpunk Aesthetic:** Custom hacker-themed wallpaper and high-contrast, optimized desktop theme.

---

## 📦 Installation & Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/DXN1-termux/CyberOS.git
   cd CyberOS
   ```
2. **Execute the Wizard:**
   ```bash
   chmod +x wizard.sh
   ./wizard.sh
   ```
   Select `[1]` to run a full installation of the security toolset and desktop environment.

---

## ⚡ Usage
Once installed, launch your environment:
```bash
./CyberOS <port>
```
*Example:* `./CyberOS 5901`

Connect any standard VNC viewer to `localhost:5901`.

---

## 🛠 Technical Stack
- **Base:** Termux (Android/Linux)
- **Desktop:** XFCE4 (Lightweight, Modular)
- **Display:** TigerVNC (Standard Protocol)
- **Shell:** POSIX-compliant Dash/Bash/Zsh
- **Build Engine:** Golang (for ProjectDiscovery & Tomnomnom tools)
- **Security:** Metasploit, Nmap, SQLMap, and more.

---

## 🔍 Troubleshooting
- **VNC Connection Refused:** Ensure the port (e.g., 5901) matches your viewer and that the `CyberOS` script reported a successful launch.
- **Tools Not Found:** Run Option `[2]` in `wizard.sh` to verify your environment path and dependencies.
- **Slow GUI:** CyberOS automatically disables compositing to save resources, but ensure your VNC viewer is set to "Low Latency" or "High Speed" mode.
- **Metasploit Fails:** Metasploit requires substantial memory; ensure at least 2GB of RAM is available during installation.

---

## 📜 Version History
- **v2.0 (Stable):** Total system overhaul. POSIX compliance, self-healing launcher, TUI management wizard, and deep tool verification.
- **v1.x:** Initial VNC-powered security lab.

---

## 🌐 Universal Compatibility
CyberOS adheres strictly to open standards:
- **VNC Viewers:** Fully compatible with RealVNC, TigerVNC, TightVNC, UltraVNC, TurboVNC, and mobile viewers (Android/iOS).
- **Terminals:** Native support for XFCE Terminal, Alacritty, GNOME Terminal, and more.

---

## 🛡 Security & Compliance
CyberOS is engineered strictly for **educational purposes** and **authorized security assessments**. Ensure all actions are within the scope of your target's bug bounty program or authorization.

---

## 🤝 Contributing
Contributions are highly encouraged. Submit pull requests or issues for new tools or performance optimizations.
