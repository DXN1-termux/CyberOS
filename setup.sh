#!/bin/bash
set -e
# ==============================================================================
# CyberOS Setup - Installation Script
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${CYBEROS_BASE}/lib/utils.sh"

log_info "Initializing CyberOS Installation..."

pkg update -y
pkg install -y termux-tools

CORE_PKGS=("wget" "curl" "git" "tmux" "python" "golang" "nodejs" "net-tools" "lsof")
for pkg in "${CORE_PKGS[@]}"; do
    ensure_dep "$pkg" || log_warn "Package failed: $pkg"
done

GUI_PKGS=("xfce4" "xfce4-goodies" "tigervnc" "firefox")
for pkg in "${GUI_PKGS[@]}"; do
    retry 3 2 pkg install -y "$pkg" || log_warn "GUI package failed: $pkg"
done

validate_installation && log_success "System integrity verified." || log_warn "Integrity check failed."

mkdir -p ~/.vnc
if [ ! -f ~/.vnc/passwd ]; then
    log_info "Setting up VNC password..."
    vncpasswd
fi

log_success "Setup complete."
