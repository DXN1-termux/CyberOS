#!/bin/bash
# CyberOS Utility Library

log_info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

log_error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
}

check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        log_error "$1 is not installed. Run setup.sh to update."
        return 1
    fi
    return 0
}
