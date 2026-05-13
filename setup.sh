#!/bin/bash

# CyberOS Setup Script (Termux Optimized)
source "$(dirname "$0")/lib/utils.sh"

log_info "Welcome to CyberOS Setup (Termux)"
log_info "Installing build dependencies and tools..."

pkg update -y
pkg install -y xfce4 xfce4-goodies tigervnc firefox wireshark-qt openjdk-17 \
    wget curl net-tools nmap sqlmap hydra \
    tmux git python golang \
    metasploit hashcat gimp \
    nikto masscan

log_info "Installing security tools via Go..."
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install -v github.com/ffuf/ffuf/v2@latest
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/projectdiscovery/gospider/cmd/gospider@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/tomnomnom/gf@latest

log_info "Optimizing XFCE..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
xfconf-query -c xfwm4 -p /general/use_compositing -s false --create -t bool || true
xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 --create -t int || true

log_info "Setting up Burp Suite..."
[ ! -f "burpsuite.jar" ] && wget -qO burpsuite.jar "https://portswigger-cdn.net/burp/releases/download?product=community&version=2024.2.1&type=Jar"
if [ ! -f "$PREFIX/bin/burpsuite" ]; then
    echo -e '#!/bin/bash\njava -jar '"$(pwd)"'/burpsuite.jar "$@"' > "$PREFIX/bin/burpsuite"
    chmod +x "$PREFIX/bin/burpsuite"
fi

log_info "Fetching Wallpaper..."
mkdir -p ~/Pictures
wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"

log_info "CyberOS setup is complete!"
echo "[>] Launch using ./CyberOS [port]"
