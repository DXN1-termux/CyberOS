#!/bin/bash
set -e
# ==============================================================================
# CyberOS Environment Isolation - Perfection v10
# ==============================================================================

# 1. Path Management
# Prevent duplicate entries in PATH
add_to_path() {
    if [ ":"$PATH":" != *":"$1":"* ]; then
        export PATH="$1":"$PATH"
    fi
}

add_to_path "$HOME"/go/bin"
add_to_path "$HOME"/.local/bin"
add_to_path "$PREFIX"/bin"

# 2. Variable Isolation
export CYBEROS_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export GO111MODULE=on

# 3. Terminal Aesthetics (POSIX safe)
export PS1="\[\e[36m\]cyber\[\e[m\]@\[\e[34m\]os \[\e[32m\]\w \[\e[m\]\$ "

# 4. Global Alias Injection (Optional but recommended)
alias cyberos="$CYBEROS_HOME"/wizard.sh"
alias vnc-clean="rm -f /tmp/.X*-lock /tmp/.X11-unix/X*"
