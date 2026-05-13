#!/bin/bash
# CyberOS Setup Wizard
CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CYBEROS_BASE/lib/utils.sh"

show_menu() {
    echo -e "\n\033[1;36m========================================"
    echo "      CyberOS Configuration Wizard      "
    echo "========================================\033[0m"
    echo "[1] Run Full Installation/Update"
    echo "[2] Verify Environment Health"
    echo "[3] Cleanup Temporary Files"
    echo "[4] Exit"
    echo -e "\033[1;36m========================================\033[0m"
}

while true; do
    show_menu
    read -p "Select an option [1-4]: " opt

    case $opt in
        1)
            log_info "Starting full installation..."
            bash "$CYBEROS_BASE/setup.sh"
            ;;
        2)
            log_info "Verifying dependencies..."
            deps=("vncserver" "nmap" "git" "python" "go" "lsof")
            all_found=true
            for dep in "${deps[@]}"; do
                check_dependency "$dep" || all_found=false
            done
            $all_found && log_success "System health check passed." || log_warn "System health check found issues."
            ;;
        3)
            log_info "Cleaning up temporary files..."
            rm -rf "$HOME/go/pkg" ~/.cache/go-build 2>/dev/null
            log_success "Cleanup complete."
            ;;
        4)
            log_info "Exiting CyberOS Wizard."
            exit 0
            ;;
        *)
            log_error "Invalid option '$opt'."
            ;;
    esac
done
