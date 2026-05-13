#!/bin/bash
# ==============================================================================
# CyberOS Setup - Resilient Manifest-Based Installer (Perfection v9)
# ==============================================================================

CYBEROS_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CYBEROS_BASE/lib/utils.sh"

log_info "Initializing CyberOS Perfection Pass IX..."

# 1. Environment & Pre-flight
[ -z "$PREFIX" ] && { log_error "Non-Termux environment detected."; exit 1; }
check_internet || exit 1
check_disk_space 2000 || exit 1

# 2. Advanced Repo Setup
log_step "Repository Synchronization"
retry 3 5 pkg update -y
# Ensure we have essential repo tools first
pkg install -y termux-tools
retry 3 2 pkg install -y x11-repo unstable-repo || log_warn "Optional repos failed (check internet)."
retry 3 5 pkg update -y

# 3. Core Manifest Installation
log_step "Deploying Core Manifest"
CORE_PKGS="wget curl git tmux python golang openjdk-17 nodejs net-tools lsof proot zip unzip htop btop nano vim make"
for pkg in $CORE_PKGS; do
    ensure_dep "$pkg" || log_warn "Package failed: $pkg"
done

# 4. Web Dashboard Setup
if [ -f "$CYBEROS_BASE/package.json" ]; then
    log_step "Configuring Web Dashboard"
    cd "$CYBEROS_BASE" && retry 3 5 npm install --silent && log_success "Web node-stack ready." || log_warn "Web stack failed."
fi

# 5. Desktop Manifest
log_step "Deploying Desktop Manifest"
GUI_PKGS="xfce4 xfce4-goodies tigervnc firefox wireshark-qt gimp adwaita-icon-theme"
for pkg in $GUI_PKGS; do
    retry 3 2 pkg install -y "$pkg" || log_warn "GUI package failed: $pkg"
done

# 6. Security Manifest (Native & Heavy)
log_step "Deploying Security Arsenal"
# nmap and sqlmap are usually stable. metasploit is the bottleneck.
SEC_PKGS="nmap sqlmap hydra metasploit hashcat nikto masscan"
for pkg in $SEC_PKGS; do
    log_info "Installing $pkg..."
    retry 2 2 pkg install -y "$pkg" || log_warn "Heavy tool failed: $pkg"
done

# 7. Go Manifest (Source Compilation)
log_step "Building Specialized Source Tools"
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
        log_info "Compiling $tool..."
        retry 2 5 go install -v "$repo" || log_warn "Build failed: $tool"
    else
        log_success "$tool already in PATH."
    fi
done

# 8. Post-Install Verification & Hardening
log_step "System Verification & Hardening"
harden_project
validate_installation && log_success "Core system integrity verified." || log_warn "Integrity check detected missing components."

# 9. Environment Aesthetics & Creds
log_info "Finalizing Desktop Configuration..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
if command -v xfconf-query >/dev/null 2>&1; then
    # Improved xfconf logic for reliable first-boot setting
    xfconf-query -c xfwm4 -p /general/theme -n -t string -s "Adwaita-dark" 2>/dev/null
    xfconf-query -c xfce4-desktop -p /desktop-icons/style -n -t int -s 0 2>/dev/null
fi

mkdir -p ~/.vnc
if [ ! -f ~/.vnc/passwd ]; then
    echo "password" | vncpasswd -f > ~/.vnc/passwd
    chmod 600 ~/.vnc/passwd
fi

# Hardened xstartup with absolute pathing and bus management
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/sh
# CyberOS Perfection Protocol
[ -f $HOME/.Xresources ] && xrdb $HOME/.Xresources
# Standard DBUS setup
if command -v dbus-launch >/dev/null; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi
# Launch XFCE
exec startxfce4 &
(sleep 10 && 
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -n -t string -s "$HOME/Pictures/cyberos-wallpaper.jpg"
    xfdesktop --reload
    mkdir -p ~/Desktop
    cat << 'EOD' > ~/Desktop/Dashboard.desktop
[Desktop Entry]
Type=Application
Name=CyberOS Dashboard
Exec=firefox http://localhost:3000
Icon=globe
EOD
    chmod +x ~/Desktop/Dashboard.desktop
) &
EOF
chmod 700 ~/.vnc/xstartup

log_info "Fetching system assets..."
mkdir -p ~/Pictures
retry 3 5 wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"

log_success "CYBEROS PERFECTION PASS IX COMPLETE!"
log_info "Run 'cyberos' to enter the ecosystem."
