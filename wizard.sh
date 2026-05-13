#!/bin/bash
set -e
# ==============================================================================
# CyberOS Wizard
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${CYBEROS_BASE}/lib/utils.sh"

while true; do
    echo -e "\nCyberOS Management Console"
    echo "1. Install/Update"
    echo "2. Diagnostics"
    echo "3. Exit"
    read -p "Select option: " opt
    case "$opt" in
        1) bash "${CYBEROS_BASE}/setup.sh" ;;
        2) validate_installation && log_success "Systems OK" || log_error "Systems compromised" ;;
        3) exit 0 ;;
        *) echo "Invalid option" ;;
    esac
done
