<h1 align="center">CyberOS v2.0.1 (PERFECTION)</h1>
<p align="center">
  <b>MADE WITH ❤️ BY DXN1</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Build-v2.0.1--Phase--X-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/Platform-Termux-brightgreen.svg" alt="Platform">
  <img src="https://img.shields.io/badge/Status-Hardened-cyan.svg" alt="Status">
</p>

---

## 📖 Overview
**CyberOS** is a specialized, zero-hassle, VNC-powered Linux distribution. Engineered specifically for security professionals, bug bounty hunters, and ethical hackers, it provides a pre-configured, hardened environment that bridges the gap between mobile flexibility and desktop power.

### 🛡️ Phase X Improvements: Self-Healing & Autonomous Resilience
- **Autonomous Doctor:** The launcher now scans and repairs the system (stale locks, permissions, binary integrity) on every boot.
- **Engine Stability Watchdog:** Real-time monitoring of the VNC core during the first 5 seconds of launch.
- **Wizard Repair Sector:** A dedicated menu for fixing common Termux/VNC drift issues without a full re-install.
- **DBUS Integration:** Automatic machine-id generation and bus-launch management for 100% session reliability.

CyberOS eliminates the tedious configuration of remote GUIs, security toolchains, and desktop environments, allowing you to focus entirely on your target.

---

## 🚀 The Ultimate Security Arsenal
CyberOS comes equipped with a massive suite of industry-standard tools (approaching 1GB in tool packages), organized for immediate deployment:

- **Recon & Discovery:** `nmap`, `masscan`, `subfinder`, `assetfinder`, `gospider`, `dnsrecon`.
- **Web Application Exploitation:** `burpsuite`, `zaproxy`, `sqlmap`, `ffuf`, `feroxbuster`, `gobuster`, `dirb`, `nikto`.
- **Networking & Traffic:** `wireshark`, `net-tools`.
- **Brute Forcing & Password Cracking:** `hydra`, `john`, `hashcat`.
- **Infrastructure Hacking:** `metasploit-framework`, `enum4linux`, `smbmap`, `ldapsearch`.
- **General Utilities:** `tmux`, `git`, `firefox`, `gimp`, `htop`, `btop`.

---

## ⚡ Features
- **Instant VNC:** Launch a functional, persistent XFCE desktop on any port.
- **Universal Compatibility:** Designed to work flawlessly with every VNC viewer and terminal emulator.
- **Optimized Performance:** Performance tweaks including disabled desktop compositing and visual effects.
- **Modular Utility Library:** A backend library (`lib/utils.sh`) provides shared, reliable logic for logging and dependency validation across all system scripts.
- **Management Console:** An interactive professional TUI wizard (`wizard.sh`) handles installation, health checks, and cleanup.
- **Cyberpunk Aesthetic:** Custom hacker-themed wallpaper and high-contrast, optimized desktop theme.
- **Web Dashboard:** A modern Next.js-powered hunting hub for tracking progress.

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
Once installed, you can launch the Management Console from anywhere using the global alias:
```bash
cyberos
```

Alternatively, use the built-in **Makefile** for automated tasks:
- `make install` - Full environment setup.
- `make launch PORT=5901` - Start VNC session.
- `make web` - Start the Next.js Dashboard.
- `make cleanup` - Reclaim storage space.

---

## 🛠 Technical Stack
- **Base:** Termux (Android/Linux)
- **Desktop:** XFCE4 (Lightweight, Modular)
- **Display:** TigerVNC (Standard Protocol)
- **Shell:** POSIX-compliant Dash/Bash/Zsh
- **Web:** Next.js, React, TailwindCSS
- **Build Engine:** Golang, Node.js
- **Security:** Metasploit, Nmap, SQLMap, and more.

---

## 🛠 Project Structure
- `CyberOS`: Self-healing session launcher.
- `wizard.sh`: Professional TUI Management Console.
- `setup.sh`: Manifest-driven hardened installer.
- `Makefile`: Universal automation interface.
- `lib/`: Centralized POSIX utility library.
- `app/`: Next.js Web Dashboard source.
- `CONTRIBUTING.md`: Guidelines for project contributors.
- `SECURITY.md`: Security and vulnerability reporting policy.

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
Contributions are highly encouraged. Please review our [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
