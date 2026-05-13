#!/bin/bash

# CyberOS Setup Script (Termux Optimized & Resilient)
source "$(dirname "$0")/lib/utils.sh"

log_info "Welcome to CyberOS Setup (Termux)"

# 1. Pre-flight check
[ -z "$PREFIX" ] && { log_error "Termux prefix not found."; exit 1; }

# 2. Package Management with retries
log_info "Updating system and installing base dependencies..."
retry pkg update -y
retry pkg install -y xfce4 xfce4-goodies tigervnc firefox wireshark-qt openjdk-17 \
    wget curl net-tools nmap tmux git python golang \
    gimp || { log_error "Base package installation failed."; exit 1; }

# 3. Security Tool Builds with validation
log_info "Installing security tools..."
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
mkdir -p "$GOPATH/bin"

tools=("subfinder" "httpx" "nuclei" "ffuf" "assetfinder" "gospider" "anew" "gf")
for tool in "${tools[@]}"; do
    log_info "Installing $tool..."
    retry go install -v "github.com/projectdiscovery/$tool/v2/cmd/$tool@latest" || \
    retry go install -v "github.com/tomnomnom/$tool@latest" || \
    retry go install -v "github.com/ffuf/ffuf/v2@latest" || \
    log_warn "Failed to install $tool, skipping."
done

# 4. XFCE Optimization with health checks
log_info "Optimizing XFCE..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
command -v xfconf-query >/dev/null && {
    xfconf-query -c xfwm4 -p /general/use_compositing -s false --create -t bool || log_warn "Failed to set compositing."
    xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 --create -t int || log_warn "Failed to set desktop icons."
}

# 5. Asset validation and setup
log_info "Setting up Burp Suite..."
[ ! -f "burpsuite.jar" ] && retry wget -qO burpsuite.jar "https://portswigger-cdn.net/burp/releases/download?product=community&version=2024.2.1&type=Jar"
if validate_file "burpsuite.jar"; then
    echo -e '#!/bin/bash\njava -jar '"$(pwd)"'/burpsuite.jar "$@"' > "$PREFIX/bin/burpsuite"
    chmod +x "$PREFIX/bin/burpsuite"
fi

log_info "Fetching Wallpaper..."
mkdir -p ~/Pictures
retry wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"
validate_file "$HOME/Pictures/cyberos-wallpaper.jpg" || log_warn "Wallpaper fetch failed."

log_info "CyberOS setup complete with resilience checks."
echo "[>] Launch using ./CyberOS [port]"
