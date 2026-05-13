#!/bin/bash
set -e

# Core Utils - The foundation
log() { echo -e "$(date +'%Y-%m-%d %H:%M:%S') [$1] $2"; }
log_info() { log "INFO" "$1"; }
log_err() { log "ERROR" "$1" >&2; }

# Validated dependencies
check_dep() {
    command -v "$1" >/dev/null 2>&1
}

# Proper loop over space-separated strings
# Usage: for_each "pkg1 pkg2" install_func
for_each() {
    local list=$1
    local func=$2
    for item in $list; do
        $func "$item"
    done
}
