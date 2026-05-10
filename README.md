# CyberOS

CyberOS is a purpose-built environment designed for security professionals and bug bounty hunters. It bridges the gap between complex security tool configuration and immediate productivity by providing a web-accessible, pre-configured Linux desktop environment.

## Features

- **Optimized for Security:** Comes pre-shipped with essential tools for reconnaissance, analysis, and exploitation:
  - **Burp Suite:** Professional-grade web vulnerability scanner and proxy.
  - **Firefox:** Pre-configured browser for web testing.
  - **Wireshark:** Network protocol analyzer for traffic inspection.
- **Web-First Access:** Access your security desktop directly through a web browser via VNC, eliminating the need for local desktop installation.
- **Rapid Deployment:** Get your bug bounty environment running in minutes.

## Getting Started

To get started, clone the repository and launch the interface.

### Installation

```bash
git clone DXN1-termux/CyberOS.git
cd CyberOS
```

### Launch

To start CyberOS and serve the VNC desktop on a specific port:

```bash
./CyberOS [port]
```

Once launched, point your VNC viewer (or web-VNC client) to the specified port to start your hunt.

## Contributing

Contributions are welcome! If you have suggestions for new tools or improvements to the environment configuration, feel free to open a pull request.
