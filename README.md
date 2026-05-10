# CyberOS

CyberOS is a zero-hassle VNC-powered Linux distribution optimized primarily for bug bounty hunting and penetration testing. It ships out-of-the-box with an XFCE desktop environment and critical tools like **Burp Suite**, **Wireshark**, and **Firefox**.

Built for security professionals and students, CyberOS completely removes the headache of setting up a remote GUI environment so you can focus entirely on your target.

## 🚀 Features

- **Instant VNC Setup:** Launch a fully functional XFCE desktop accessible via VNC on any port of your choosing.
- **Pre-installed Security Arsenal:** Everything you need for web exploitation and network inspection is pre-configured.
- **Lightweight & Fast:** Minimal overhead, optimized for performance on remote VPS instances or local VMs.

## 📦 Installation

To get the environment cloned and dependencies installed:

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

## 🛠️ Included Tools

- **Desktop:** XFCE4 
- **Web Security:** Burp Suite Community Edition (Java)
- **Browser:** Firefox (Configured for Burp Suite routing)
- **Networking:** Wireshark

---
*Disclaimer: CyberOS is built for educational and authorized security testing only.*
