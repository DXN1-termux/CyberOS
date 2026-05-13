# Contributing to CyberOS

First off, thank you for considering contributing to CyberOS! It's people like you that make CyberOS such a great tool for the security community.

## How Can I Contribute?

### Reporting Bugs
- Use the [GitHub issue tracker](https://github.com/DXN1-termux/CyberOS/issues).
- Check if the bug has already been reported.
- Be clear and concise. Include logs from `~/.vnc/` if the issue is VNC-related.

### Suggesting Enhancements
- Open an issue describing the feature you'd like to see.
- Explain why this feature would be useful for other users.

### Pull Requests
1. Fork the repo and create your branch from `main`.
2. Ensure your code follows the POSIX-compliant shell script guidelines (if applicable).
3. If you've added a new tool, update the `README.md` and `setup.sh` manifests.
4. Test your changes in a clean Termux environment if possible.

## Style Guidelines
- **Shell Scripts:** Use POSIX-compliant syntax (no Bashisms like `[[ ]]`). Use the `log_` functions from `lib/utils.sh` for all output.
- **Web Dashboard:** Use React/Next.js with TailwindCSS. Keep it mobile-responsive.

## Code of Conduct
Please be respectful and professional in all interactions. We aim to build a welcoming community for ethical hackers of all levels.
