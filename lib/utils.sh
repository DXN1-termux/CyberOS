#!/bin/bash
# CyberOS Utility Library

log_info() { echo -e "\033[1;34m[INFO]\033[0m $1"; }
log_error() { echo -e "\033[1;31m[ERROR]\033[0m $1"; }
log_warn() { echo -e "\033[1;33m[WARN]\033[0m $1"; }
log_success() { echo -e "\033[1;32m[SUCCESS]\033[0m $1"; }

# Retry mechanism for volatile network operations
retry() {
    local n=1
    local max=3
    local delay=5
    while true; do
        "$@" && break || {
            if [ $n -lt $max ]; then
                ((n++))
                log_warn "Command failed. Attempt $n/$max. Retrying in $delay seconds..."
                sleep $delay
            else
                log_error "Command failed after $max attempts."
                return 1
            fi
        }
    done
}

# Persistent environment configuration
add_to_path() {
    local entry="$1"
    if ! grep -q "$entry" ~/.bashrc 2>/dev/null; then
        echo "export PATH=\$PATH:$entry" >> ~/.bashrc
        log_info "Added $entry to ~/.bashrc"
    fi
}

check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        log_error "Dependency '$1' missing."
        return 1
    fi
    return 0
}

validate_file() {
    if [ ! -s "$1" ]; then
        log_error "File '$1' is missing or empty."
        return 1
    fi
    return 0
}
