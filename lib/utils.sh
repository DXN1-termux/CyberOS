#!/bin/bash
# ==============================================================================
# CyberOS Utility Library - Core Logic & Resilience
# ==============================================================================

# ANSI Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Logging Functions
log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; }

# Internet connectivity check
check_internet() {
    log_info "Checking internet connectivity..."
    if ! ping -c 1 8.8.8.8 &>/dev/null; then
        log_error "No internet connection detected. Please check your network."
        return 1
    fi
    return 0
}

# Advanced Retry Mechanism
# Usage: retry <max_attempts> <delay> <command...>
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

# Dependency Manager (Auto-Install)
ensure_dep() {
    local dep=$1
    local pkg=${2:-$dep}
    if ! command -v "$dep" &>/dev/null; then
        log_info "Missing dependency: $dep. Attempting installation..."
        pkg install -y "$pkg" || {
            log_error "Failed to install $pkg. Manual intervention required."
            return 1
        }
    fi
    return 0
}

# Path Management
update_env_path() {
    local entry=$1
    if ! grep -q "$entry" ~/.bashrc 2>/dev/null; then
        echo "export PATH=\$PATH:$entry" >> ~/.bashrc
        log_success "Added $entry to PATH in ~/.bashrc"
    fi
    export PATH="$PATH:$entry"
}

# Disk Space Verification (Requirement in MB)
check_disk_space() {
    local required=$1
    local available=$(df -m . | awk 'NR==2 {print $4}')
    if [ "$available" -lt "$required" ]; then
        log_error "Insufficient disk space. Available: ${available}MB, Required: ${required}MB"
        return 1
    fi
    log_info "Disk space verified: ${available}MB available."
    return 0
}
