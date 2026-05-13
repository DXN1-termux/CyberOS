#!/bin/bash
set -e

# Load Base
CYBEROS_BASE="$(dirname "$(readlink -f "$0")")"
source "${CYBEROS_BASE}/lib/utils.sh"

install_pkg() {
    log_info "Installing $1..."
    pkg install -y "$1"
}

# 1. Update
log_info "Updating repository..."
pkg update -y

# 2. Base Packages
CORE_PKGS="wget curl git tmux python golang nodejs net-tools lsof"
for_each "$CORE_PKGS" install_pkg

# 3. GUI
GUI_PKGS="xfce4 tigervnc firefox"
for_each "$GUI_PKGS" install_pkg

log_info "Installation complete."
