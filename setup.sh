#!/bin/bash
# ==============================================================================
# CyberOS Setup - Resilient Manifest-Based Installer (Perfected)
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CYBEROS_BASE/lib/utils.sh"

log_info "Starting CyberOS 2.0 Hardened Installation..."

# 1. Environment & Network Verification
[ -z "$PREFIX" ] && { log_error "Not running in Termux environment."; exit 1; }
check_internet || exit 1

# 2. Repository Management
log_info "Initializing repositories..."
retry 3 5 pkg update -y
pkg install -y x11-repo unstable-repo
retry 3 5 pkg update -y

# 3. Core System Manifest (Expanded)
CORE_PKGS="wget curl git tmux python golang openjdk-17 nodejs net-tools lsof proot zip unzip htop btop nano vim make"

log_info "Installing core system packages..."
for pkg in $CORE_PKGS; do
    ensure_dep "$pkg" || log_warn "Failed to install core package: $pkg"
done

# Create global alias for CyberOS
if ! grep -q "alias cyberos" ~/.bashrc 2>/dev/null; then
    echo "alias cyberos='cd $CYBEROS_BASE && ./wizard.sh'" >> ~/.bashrc
    log_success "Created 'cyberos' alias in ~/.bashrc"
fi

# Install Web Dependencies if package.json exists
if [ -f "$CYBEROS_BASE/package.json" ]; then
    log_info "Initializing Web Dashboard dependencies..."
    cd "$CYBEROS_BASE" && retry 3 5 npm install --silent || log_warn "Web dependency install failed."
fi

# 4. GUI Environment Manifest
GUI_PKGS="xfce4 xfce4-goodies tigervnc firefox wireshark-qt gimp adwaita-icon-theme"

log_info "Installing desktop environment..."
for pkg in $GUI_PKGS; do
    retry 3 2 pkg install -y "$pkg" || log_warn "GUI component failed: $pkg"
done

# 5. Security Toolset (Native)
SEC_PKGS="nmap sqlmap hydra metasploit hashcat nikto masscan"
log_info "Installing native security tools..."
for pkg in $SEC_PKGS; do
    retry 2 2 pkg install -y "$pkg" || log_warn "Native tool failed: $pkg"
done

# 6. Go Toolset (Build from Source)
log_info "Building Go-based security tools..."
update_env_path "$HOME/go/bin"
mkdir -p "$HOME/go/bin"

GO_TOOLS="subfinder:github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest \
httpx:github.com/projectdiscovery/httpx/cmd/httpx@latest \
nuclei:github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest \
ffuf:github.com/ffuf/ffuf/v2@latest \
assetfinder:github.com/tomnomnom/assetfinder@latest \
anew:github.com/tomnomnom/anew@latest"

for entry in $GO_TOOLS; do
    tool=$(echo "$entry" | cut -d: -f1)
    repo=$(echo "$entry" | cut -d: -f2)
    if ! command -v "$tool" >/dev/null 2>&1; then
        log_info "Building $tool..."
        retry 2 5 go install -v "$repo" || log_warn "Failed to build $tool"
    else
        log_success "$tool is already available."
    fi
done

# Deep Verification Phase
log_info "Running final tool verification..."
ALL_TOOLS="nmap sqlmap hydra msfconsole hashcat nikto masscan subfinder httpx nuclei ffuf assetfinder anew"
MISSING_COUNT=0
for tool in $ALL_TOOLS; do
    if command -v "$tool" >/dev/null 2>&1; then
        log_success "Verified: $tool"
    else
        log_warn "Verification failed: $tool"
        MISSING_COUNT=$((MISSING_COUNT + 1))
    fi
done

if [ "$MISSING_COUNT" -eq 0 ]; then
    log_success "PERFECT INSTALL: All tools verified."
else
    log_warn "Installation finished with $MISSING_COUNT missing tools."
fi

# 7. Final Configuration & Aesthetic
log_info "Applying system optimizations..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
if command -v xfconf-query &>/dev/null; then
    xfconf-query -c xfwm4 -p /general/use_compositing -s false --create -t bool 2>/dev/null
    xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 --create -t int 2>/dev/null
fi

log_info "Configuring VNC Security & Desktop Environment..."
mkdir -p ~/.vnc
if [ ! -f ~/.vnc/passwd ]; then
    echo "password" | vncpasswd -f > ~/.vnc/passwd
    chmod 600 ~/.vnc/passwd
    log_success "VNC password initialized to 'password'"
fi

# Modernized xstartup for peak stability
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
if command -v dbus-launch >/dev/null; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi
startxfce4 &
(sleep 8 && 
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s "$HOME/Pictures/cyberos-wallpaper.jpg" --create -t string
    xfconf-query -c xfwm4 -p /general/theme -s "Adwaita-dark" --create -t string
    xfdesktop --reload
    mkdir -p ~/Desktop
    cat << 'EOD' > ~/Desktop/CyberOS-Dashboard.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=CyberOS Dashboard
Comment=Launch the Web-based Hunting Hub
Exec=firefox http://localhost:3000
Icon=globe
Terminal=false
StartupNotify=false
EOD
    chmod +x ~/Desktop/CyberOS-Dashboard.desktop
) &
EOF
chmod +x ~/.vnc/xstartup

log_info "Fetching custom assets..."
mkdir -p ~/Pictures
retry 3 5 wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"

log_success "CyberOS 2.0 Hardened Installation Complete!"
log_info "Run './CyberOS [port]' to begin your session."
