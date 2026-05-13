#!/bin/bash
set -e
# ==============================================================================
# CyberOS Utility Library - Core Logic & Resilience (Perfected)
# ==============================================================================

# ANSI Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Load Central Configuration
[ -f "${CYBEROS_BASE}/lib/config.sh" ] && . "${CYBEROS_BASE}/lib/config.sh"

# Logging Functions
log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; }
log_step()    { echo -e "\n${CYAN}>>> $1${NC}"; }

# Internet connectivity check
check_internet() {
    log_info "Checking internet connectivity..."
    if ! ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        log_error "No internet connection detected. Please check your network."
        return 1
    fi
    return 0
}

# Advanced Retry Mechanism
retry() {
    local max="$1"; shift
    local delay="$1"; shift
    local n=1
    while true; do
        "$@" && break || {
            if [ "$n" -lt "$max" ]; then
                log_warn "Command failed. Attempt $n/$max. Retrying in ${delay}s..."
                sleep "$delay"
                n=$((n + 1))
            else
                log_error "Command failed after $max attempts."
                return 1
            fi
        }
    done
}

# Port Status Check
is_port_open() {
    lsof -Pi :"$1" -sTCP:LISTEN -t >/dev/null 2>&1
}

# Dependency Manager
ensure_dep() {
    local dep=$1
    local pkg=${2:-$dep}
    if ! command -v "$dep" >/dev/null 2>&1; then
        log_info "Missing dependency: $dep. Attempting installation..."
        pkg install -y "$pkg" || {
            log_error "Failed to install $pkg. Manual intervention required."
            return 1
        }
    fi
    return 0
}

# Project Hardening Utility
harden_project() {
    log_info "Applying security hardening to project files..."
    find "$CYBEROS_BASE" -type f -name "*.sh" -exec chmod 700 {} +
    [ -f "$CYBEROS_BASE/.env" ] && chmod 600 "$CYBEROS_BASE/.env"
    [ -f "$HOME/.vnc/passwd" ] && chmod 600 "$HOME/.vnc/passwd"
    log_success "Hardening complete. Permissions restricted to owner."
}

# Persistent environment configuration (Refined for Isolation)
update_env_path() {
    local entry=$1
    local env_file="${CYBEROS_ENV_FILE:-$CYBEROS_BASE/lib/env.sh}"
    mkdir -p "$(dirname "$env_file")"
    touch "$env_file"
    if ! grep -q "$entry" "$env_file" 2>/dev/null; then
        echo "export PATH=\$PATH:$entry" >> "$env_file"
        log_info "Registered $entry in CyberOS environment."
    fi
    # Ensure source link in ~/.bashrc
    if ! grep -q "source $env_file" ~/.bashrc 2>/dev/null; then
        echo "[ -f \"$env_file\" ] && . \"$env_file\"" >> ~/.bashrc
        log_success "Integrated CyberOS environment with shell profile."
    fi
    export PATH="$PATH:$entry"
}

# ==============================================================================
# CyberOS Utility Library - High-Fidelity Infrastructure (Perfection Loop 1/5)
# ==============================================================================

# Unified Logging - Standardized for machine-readable auditing
log_level() { echo -e "$(date +'%Y-%m-%dT%H:%M:%S%z') [$1] $2"; }
log_info()  { log_level "INFO" "$1"; }
log_warn()  { log_level "WARN" "$1"; }
log_error() { log_level "ERR " "$1" >&2; }
log_step()  { echo -e "\n\e[1;36m==> $1\e[0m"; }
log_success() { log_level "SUCC" "$1"; }

# Fail-safe command wrapper
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

# Hardened Permission Matrix
harden_project() {
    log_info "Locking down project filesystem..."
    # Set directory to 700, files to 600
    find "$CYBEROS_BASE" -type d -exec chmod 700 {} +
    find "$CYBEROS_BASE" -type f -name "*.sh" -exec chmod 700 {} +
    find "$CYBEROS_BASE" -type f ! -name "*.sh" -exec chmod 600 {} +
    log_success "Project filesystem integrity hardened."
}

# Dependency Integrity
ensure_dep() {
    if ! command -v "$1" >/dev/null 2>&1; then
        log_info "Installing missing dependency: $1"
        pkg install -y "$1" >/dev/null 2>&1 || return 1
    fi
}

# Network Health
check_internet() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1
}

# Resource-Safe Process Reaping
reap_process() {
    local target="$1"
    log_info "Reaping processes related to: $target"
    pgrep -f "$target" | xargs -r kill -9 >/dev/null 2>&1
    log_success "Cleaned $target resources."
}

# Advanced Resource Cleanup
deep_cleanup() {
    log_step "Deep Resource Scrubbing"
    reap_process "metasploit"
    reap_process "burp"
    reap_process "wireshark"
    rm -rf "$HOME/go/pkg" ~/.cache/go-build
    find "$CYBEROS_LOG_DIR" -name "*.log" -exec truncate -s 0 {} +
    log_success "Resource footprint minimized."
}
