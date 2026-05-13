#!/bin/bash
# CyberOS Setup Wizard
source "$(dirname "$0")/lib/utils.sh"

echo -e "\033[1;36m========================================"
echo "      CyberOS Configuration Wizard      "
echo "========================================\033[0m"

echo "[1] Run Full Installation/Update"
echo "[2] Verify Environment Dependencies"
echo "[3] Cleanup Environment"
echo "[4] Exit"

read -p "Select an option [1-4]: " opt

case $opt in
    1)
        log_info "Starting full installation..."
        chmod +x setup.sh
        ./setup.sh
        ;;
    2)
        log_info "Verifying dependencies..."
        check_dependency vncserver && check_dependency nmap && check_dependency git && log_info "All core tools found."
        ;;
    3)
        log_info "Cleaning up temporary files..."
        rm -rf "$GOPATH/pkg" ~/.cache/go-build
        log_info "Cleanup complete."
        ;;
    4)
        exit 0
        ;;
    *)
        log_error "Invalid option."
        ;;
esac
