#!/bin/bash
set -e
# ==============================================================================
# CyberOS Utility Library - Core Infrastructure
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log_info() { echo -e "$(date +'%Y-%m-%dT%H:%M:%S') [INFO] $1"; }
log_warn() { echo -e "$(date +'%Y-%m-%dT%H:%M:%S') [WARN] $1"; }
log_error() { echo -e "$(date +'%Y-%m-%dT%H:%M:%S') [ERR ] $1" >&2; }
log_step() { echo -e "\n\e[1;36m==> $1\e[0m"; }
log_success() { echo -e "$(date +'%Y-%m-%dT%H:%M:%S') [SUCC] $1"; }

retry() {
    local max=$1; shift
    local delay=$1; shift
    local count=0
    until "$@"; do
        count=$((count + 1))
        [ $count -lt "$max" ] || return 1
        sleep "$delay"
    done
}

harden_project() {
    log_info "Applying filesystem security permissions..."
    find "$CYBEROS_BASE" -type d -exec chmod 700 {} +
    find "$CYBEROS_BASE" -type f -name "*.sh" -exec chmod 700 {} +
    find "$CYBEROS_BASE" -type f ! -name "*.sh" -exec chmod 600 {} +
    log_success "Filesystem permissions hardened."
}

ensure_dep() {
    if ! command -v "$1" >/dev/null 2>&1; then
        log_info "Installing missing dependency: $1"
        pkg install -y "$1" >/dev/null 2>&1 || return 1
    fi
}

validate_installation() {
    log_info "Verifying core binary integrity..."
    local critical=("vncserver" "xfce4-session" "lsof" "git" "node")
    for tool in "${critical[@]}"; do
        if ! command -v "$tool" >/dev/null 2>&1; then
            log_error "Critical tool integrity failure: $tool not found."
            return 1
        fi
    done
    return 0
}

is_port_open() {
    netstat -tuln | grep -q ":$1 "
}
