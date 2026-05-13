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
    echo -e " ${BLUE}[4]${NC} Launch Web Dashboard (Next.js)"
    echo -e " ${BLUE}[5]${NC} Reset VNC Credentials"
    echo -e " ${BLUE}[6]${NC} System Security Hardening"
    echo -e " ${BLUE}[7]${NC} View README / Documentation"
    echo -e " ${RED}[0]${NC} Exit Console"
    echo -e "\n${CYAN}==================================================${NC}"
}

while true; do
    header
    menu
    printf "Select choice [0-7]: "
    read -r opt

    case "$opt" in
        1)
            log_info "Initiating Full Installation..."
            bash "$CYBEROS_BASE/setup.sh"
            printf "Press enter to return to menu..."
            read -r _
            ;;
        2)
            log_info "Running Deep Diagnostics..."
            # Check for critical tools
            tools="vncserver xfce4-session nmap git python go lsof node npm"
            failures=0
            for tool in $tools; do
                if command -v "$tool" >/dev/null 2>&1; then
                    log_success "Found: $tool"
                else
                    log_error "Missing: $tool"
                    failures=$((failures + 1))
                fi
            done
            if [ "$failures" -eq 0 ]; then
                log_success "All systems operational."
            else
                log_warn "$failures issues detected."
            fi
            printf "Press enter to return to menu..."
            read -r _
            ;;
        3)
            log_info "Cleaning temporary build artifacts..."
            rm -rf "$HOME/go/pkg" ~/.cache/go-build >/dev/null 2>&1
            find ~/.vnc -name "*.log" -exec truncate -s 0 {} +
            log_success "Cleanup complete. Storage recovered and logs rotated."
            sleep 2
            ;;
        4)
            log_info "Launching Web Dashboard..."
            if [ -d "$CYBEROS_BASE/node_modules" ]; then
                cd "$CYBEROS_BASE" && npm run dev &
                log_success "Dashboard starting on http://localhost:3000"
            else
                log_error "Dashboard dependencies missing. Run installation first."
            fi
            sleep 3
            ;;
        5)
            log_info "Resetting VNC Password..."
            vncpasswd
            log_success "Password updated successfully."
            sleep 2
            ;;
        6)
            harden_project
            sleep 2
            ;;
        7)
            header
            head -n 50 "$CYBEROS_BASE/README.md"
            echo -e "\n... (Scroll up for more) ..."
            printf "Press enter to return to menu..."
            read -r _
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
