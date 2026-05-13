#!/bin/bash
# ==============================================================================
# CyberOS Centralized Configuration - Environment Constants
# ==============================================================================

# Global Project Identity
CYBEROS_VERSION="2.0.1"
CYBEROS_CODENAME="PERFECTION"

# Default Session Settings
DEFAULT_VNC_PORT=5901
DEFAULT_VNC_GEOMETRY="1280x720"
DEFAULT_VNC_DEPTH=24
DEFAULT_VNC_NAME="CyberOS"

# Web Dashboard Settings
DEFAULT_WEB_PORT=3000
WEB_AUTO_START=false

# System Resource Thresholds
MIN_DISK_SPACE_MB=2000
MIN_RAM_HINT_MB=2048

# Aesthetics
THEME_NAME="Adwaita-dark"
WALLPAPER_URL="https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"

# Paths
CYBEROS_LOG_DIR="$HOME/.vnc"
CYBEROS_ENV_FILE="$CYBEROS_BASE/lib/env.sh"
