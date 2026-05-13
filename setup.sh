#!/bin/bash
set -e
CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${CYBEROS_BASE}/lib/utils.sh"
log_info "Initializing CyberOS Perfection Pass XIV..."
check_internet || exit 1
retry 3 5 pkg update -y
pkg install -y termux-tools
retry 3 2 pkg install -y x11-repo unstable-repo || log_warn "Optional repos failed."
retry 3 5 pkg update -y
