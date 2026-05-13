#!/bin/bash
set -e
# ==============================================================================
# CyberOS Wizard - Professional Management Console (Perfection v10)
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CYBEROS_BASE/lib/config.sh"
source "$CYBEROS_BASE/lib/utils.sh"

# Signal Traps for robust termination
cleanup_and_exit() {
    log_info "Received interrupt. Cleaning up resources..."
    exit 0
}
trap cleanup_and_exit SIGINT SIGTERM

header() {
    clear
    echo -e "${CYAN}==================================================${NC}"
    echo -e "          ${BLUE}CYBEROS MANAGEMENT CONSOLE${NC}           "
    echo -e "          Version:  "$CYBEROS_VERSION" ( "$CYBEROS_CODENAME")          "
    echo -e "${CYAN}==================================================${NC}"
}

menu() {
    echo -e "\n ${BLUE}[1]${NC} Full Installation / Engine Update"
    echo -e " ${BLUE}[2]${NC} Deep System Health Diagnostic"
    echo -e " ${BLUE}[3]${NC} Autonomous Repair & Rebuild"
    echo -e " ${BLUE}[4]${NC} Resource Cleanup & Log Rotation"
    echo -e " ${BLUE}[5]${NC} Dashboard Control Center"
    echo -e " ${BLUE}[6]${NC} Security Matrix & Hardening"
    echo -e " ${BLUE}[7]${NC} Configuration Editor"
    echo -e " ${RED}[0]${NC} Terminal Exit"
    echo -e "\n${CYAN}==================================================${NC}"
}

while true; do
    header
    menu
    printf "Select sector [0-7]: "
    read -r opt

    case  "$opt" in
        1)
            log_step "Initializing Engine Update"
            bash "$CYBEROS_BASE/setup.sh"
            printf "\nPress ENTER to return..." && read -r _
            ;;
        2)
            log_step "Running Deep Diagnostic Suite"
            validate_installation && log_success "Core Integrity: VERIFIED" || log_error "Core Integrity: COMPROMISED"
            check_internet && log_success "Network Link: ACTIVE" || log_warn "Network Link: DEGRADED"
            check_disk_space  "$MIN_DISK_SPACE_MB"
            printf "\nPress ENTER to return..." && read -r _
            ;;
        3)
            log_step "Initiating Autonomous Repair"
            log_info "Synchronizing filesystem permissions..."
            harden_project
            log_info "Neutralizing stale lock files..."
            rm -f /tmp/.X*-lock /tmp/.X11-unix/X* >/dev/null 2>&1
            log_info "Rebuilding VNC manifests..."
            mkdir -p ~/.vnc && chmod 700 ~/.vnc
            log_success "Autonomous repair sequence complete."
            sleep 2
            ;;
        4)
            log_step "Resource Optimization"
            rm -rf "$HOME/go/pkg" ~/.cache/go-build >/dev/null 2>&1
            find  "$CYBEROS_LOG_DIR" -name "*.log" -exec truncate -s 0 {} +
            log_success "Optimized system footprint."
            sleep 2
            ;;
        5)
            header
            echo -e " ${BLUE}[1]${NC} Start Web Dashboard"
            echo -e " ${BLUE}[2]${NC} Stop Web Dashboard"
            echo -e " ${BLUE}[3]${NC} View Dashboard Logs"
            echo -e " ${BLUE}[0]${NC} Return"
            read -r db_opt
            case  "$db_opt" in
                1) 
                    cd  "$CYBEROS_BASE" && npm run dev &>/dev/null & 
                    log_success "Dashboard signal active." ;;
                2) 
                    pkill -f "next-server" && log_success "Dashboard signal terminated." ;;
                3) 
                    tail -n 20 "$CYBEROS_BASE/.next/trace" 2>/dev/null || log_warn "No logs found." ;;
            esac
            sleep 2
            ;;
        6)
            harden_project
            log_success "Security matrix updated."
            sleep 2
            ;;
        7)
            log_info "Opening Configuration Editor (lib/config.sh)..."
            nano "$CYBEROS_BASE/lib/config.sh"
            ;;
        0)
            log_info "Disconnecting from Management Console."
            exit 0
            ;;
        *)
            log_error "Invalid sector:  "$opt"
            sleep 1
            ;;
    esac
done
