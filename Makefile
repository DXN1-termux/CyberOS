# CyberOS - Universal Build & Automation System

.PHONY: all install launch wizard cleanup web status help

all: wizard

install:
	@bash ./setup.sh

launch:
	@bash ./CyberOS $(PORT)

wizard:
	@bash ./wizard.sh

cleanup:
	@rm -rf ~/go/pkg ~/.cache/go-build 2>/dev/null
	@echo "Resource cleanup complete."

web:
	@npm run dev

status:
	@bash ./wizard.sh --health

help:
	@echo "CyberOS v2.0 Automation Interface"
	@echo "---------------------------------"
	@echo "make install  - Run the full setup"
	@echo "make launch   - Start CyberOS (PORT=5901)"
	@echo "make wizard   - Open the Management Console"
	@echo "make web      - Start the Next.js Dashboard"
	@echo "make cleanup  - Reclaim storage"
	@echo "make status   - Run health diagnostics"
