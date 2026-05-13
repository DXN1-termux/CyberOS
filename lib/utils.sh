#!/bin/bash
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

# Disk Space Verification
check_disk_space() {
    local required=${1:-2000}
    local available=$(df -m . | awk 'NR==2 {print $4}')
    if [ "$available" -lt "$required" ]; then
        log_error "Insufficient disk space. Available: ${available}MB, Required: ${required}MB"
        return 1
    fi
    log_info "Disk space verified: ${available}MB available."
    return 0
}
