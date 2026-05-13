# ==============================================================================
# CyberOS Makefile - Perfection v10
# ==============================================================================

.PHONY: install launch wizard web cleanup status doctor repair

all: status

install:
	@echo "Initializing CyberOS Installation..."
	@bash setup.sh

launch:
	@echo "Starting CyberOS Engine..."
	@bash CyberOS

wizard:
	@bash wizard.sh

web:
	@echo "Launching Dashboard..."
	@npm run dev

cleanup:
	@echo "Cleaning System Artifacts..."
	@rm -rf ~/go/pkg ~/.cache/go-build
	@find ~/.vnc -name "*.log" -exec truncate -s 0 {} +

status:
	@echo "--- CyberOS Status Report ---"
	@echo "Version: 2.0.1 (PERFECTION)"
	@if [ -d "node_modules" ]; then echo "Dashboard: Ready"; else echo "Dashboard: Dependencies Missing"; fi
	@if command -v vncserver >/dev/null; then echo "VNC Engine: OK"; else echo "VNC Engine: MISSING"; fi

doctor:
	@echo "Running System Health Check..."
	@bash CyberOS --doctor # This will trigger the autonomous_doctor function indirectly if I add a flag, but for now we'll just use wizard
	@echo "Use 'make wizard' and select option 2 for deep diagnostics."

repair:
	@echo "Executing Autonomous Repair..."
	@rm -f /tmp/.X*-lock /tmp/.X11-unix/X*
	@chmod +x CyberOS setup.sh wizard.sh
	@echo "Repair sequence finished."
