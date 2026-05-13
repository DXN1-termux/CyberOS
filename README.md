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

CyberOS is a zero-hassle, fully loaded VNC-powered Linux distribution optimized for serious bug bounty hunting, penetration testing, and heavy-duty recon. It ships out-of-the-box with a custom-themed XFCE desktop environment and an extensive arsenal of industry-standard tools.

Built for security professionals and students, CyberOS completely removes the headache of setting up a remote GUI environment and installing toolchains so you can focus entirely on the target.

---

## 🚀 Features

- **Instant VNC Setup:** Launch a fully functional XFCE desktop accessible via VNC.
- **Custom Cyberpunk Aesthetic:** Ships with a custom hacker-themed wallpaper and beautifully configured XFCE desktop.
- **The Ultimate Security Arsenal:** Pre-configured with a massive suite of tools including:
  - **Web Exploitation:** Burp Suite, SQLmap, Wfuzz
  - **Recon & Enumeration:** Nmap, Gobuster, Dirb, Subfinder, Httpx, Nuclei
  - **Networking:** Wireshark, Net-tools
  - **Brute Forcing:** Hydra, John the Ripper, SecLists
  - **Daily Drivers:** Firefox (proxied), Tmux, Git
- **Lightweight & Fast:** Optimized for performance with XFCE visual effects disabled by default.
- **Modular Utility Library:** Shared logic for logging and dependency validation.
- **Setup Wizard:** Interactive `wizard.sh` for guided configuration.

---

## 📦 Installation & Setup

1. **Clone the repo:**
   ```bash
   git clone https://github.com/DXN1-termux/CyberOS.git
   cd CyberOS
   ```
2. **Launch the Wizard:**
   ```bash
   chmod +x wizard.sh
   ./wizard.sh
   ```
   Select `[1]` to perform a full installation.

---

## ⚡ Usage

To start your bug hunting environment:

```bash
./CyberOS <port>
```
*Example: `./CyberOS 5901`*

Connect your favorite VNC viewer to `localhost:5901`.

---

## 🛠 Project Structure

- `CyberOS`: The primary launcher script.
- `wizard.sh`: Interactive setup and maintenance wizard.
- `setup.sh`: Automated dependency installer.
- `lib/`: Shared modules and utility functions.
- `hooks/`: Custom scripts for advanced user integration.

---

## 🌐 Universal Compatibility

CyberOS is built on open standards, ensuring compatibility with virtually every VNC viewer and terminal emulator available:

- **Supported VNC Viewers:** RealVNC, TightVNC, TigerVNC, UltraVNC, TurboVNC, and mobile clients like VNC Viewer for Android/iOS.
- **Supported Terminals:** Seamlessly works with XFCE Terminal, Konsole, GNOME Terminal, Alacritty, and any other terminal emulator installed within the XFCE session.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to open an issue or pull request for any improvements or new tool suggestions.
