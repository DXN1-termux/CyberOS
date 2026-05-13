#!/bin/bash
# ==============================================================================
# CyberOS TUI Headless Test Script - Perfection Cycle 4/5
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export CYBEROS_TEST_MODE=true

log_info() { echo "[TEST-INFO] $1"; }

log_info "Simulating System Diagnostic Sector [2]..."
(echo "2"; sleep 2; echo "0") | bash "$CYBEROS_BASE/wizard.sh" >/dev/null 2>&1
[ $? -eq 0 ] && log_info "Diagnostic Test PASSED." || { echo "Diagnostic Test FAILED"; exit 1; }

log_info "Simulating Hardening Matrix Sector [6]..."
(echo "6"; sleep 2; echo "0") | bash "$CYBEROS_BASE/wizard.sh" >/dev/null 2>&1
[ $? -eq 0 ] && log_info "Hardening Test PASSED." || { echo "Hardening Test FAILED"; exit 1; }

log_info "All TUI integration tests PASSED."
