#!/bin/bash
# ==============================================================================
# CyberOS Wizard - Professional Management Console
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CYBEROS_BASE/lib/utils.sh"

header() {
    clear
    echo -e "${CYAN}==================================================${NC}"
    echo -e "          ${BLUE}CYBEROS MANAGEMENT CONSOLE${NC}           "
    echo -e "${CYAN}==================================================${NC}"
    echo -e " Version: 2.0 (Stable) | User: $(whoami)"
    echo -e "${CYAN}==================================================${NC}"
}

menu() {
    echo -e "\n ${BLUE}[1]${NC} Full System Installation / Update"
    echo -e " ${BLUE}[2]${NC} System Health Diagnostics"
    echo -e " ${BLUE}[3]${NC} Automated Resource Cleanup"
    echo -e " ${BLUE}[4]${NC} Reset VNC Credentials"
    echo -e " ${BLUE}[5]${NC} View README / Documentation"
    echo -e " ${RED}[0]${NC} Exit Console"
    echo -e "\n${CYAN}==================================================${NC}"
}

while true; do
    header
    menu
    read -p "Select choice [0-5]: " opt

    case $opt in
        1)
            log_info "Initiating Full Installation..."
            bash "$CYBEROS_BASE/setup.sh"
            read -p "Press enter to return to menu..."
            ;;
        2)
            log_info "Running Deep Diagnostics..."
            tools=("vncserver" "xfce4-session" "nmap" "git" "python" "go" "lsof")
            failures=0
            for tool in "${tools[@]}"; do
                if command -v "$tool" &>/dev/null; then
                    log_success "Found: $tool"
                else
                    log_error "Missing: $tool"
                    ((failures++))
                fi
            done
            [ $failures -eq 0 ] && log_success "All systems operational." || log_warn "$failures issues detected."
            read -p "Press enter to return to menu..."
            ;;
        3)
            log_info "Cleaning temporary build artifacts..."
            rm -rf "$HOME/go/pkg" ~/.cache/go-build 2>/dev/null
            log_success "Cleanup complete. Storage recovered."
            sleep 2
            ;;
        4)
            log_info "Resetting VNC Password..."
            vncpasswd
            log_success "Password updated successfully."
            sleep 2
            ;;
        5)
            header
            cat "$CYBEROS_BASE/README.md" | head -n 50
            echo -e "\n... (Scroll up for more) ..."
            read -p "Press enter to return to menu..."
            ;;
        0)
            log_info "Shutting down Management Console. Stay safe."
            exit 0
            ;;
        *)
            log_error "Invalid selection: $opt"
            sleep 1
            ;;
    esac
done
