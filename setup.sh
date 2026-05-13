#!/bin/bash

# CyberOS Setup Script (Termux Optimized)
source "$(dirname "$0")/lib/utils.sh"

log_info "Welcome to CyberOS Setup (Termux)"
log_info "Installing dependencies..."

# Termux uses 'pkg' for package management
pkg update -y
pkg install -y xfce4 xfce4-goodies tigervnc firefox wireshark-qt openjdk-17 \
    wget curl net-tools nmap sqlmap gobuster dirb hydra \
    john aircrack-ng tmux git python \
    subfinder httpx nuclei \
    metasploit hashcat burpsuite zaproxy gimp \
    nikto masscan enum4linux smbmap ldapsearch dnsrecon \
    ffuf gf anew assetfinder gospider feroxbuster

log_info "Optimizing XFCE..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
# Disable compositing and desktop icons to save resources
xfconf-query -c xfwm4 -p /general/use_compositing -s false --create -t bool
xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 --create -t int

log_info "Setting up Burp Suite..."
if [ ! -f "burpsuite.jar" ]; then
    wget -qO burpsuite.jar "https://portswigger-cdn.net/burp/releases/download?product=community&version=2024.2.1&type=Jar"
fi

if [ ! -f "$PREFIX/bin/burpsuite" ]; then
    echo -e '#!/bin/bash\njava -jar '"$(pwd)"'/burpsuite.jar "$@"' > "$PREFIX/bin/burpsuite"
    chmod +x "$PREFIX/bin/burpsuite"
fi

log_info "Fetching Wallpaper..."
mkdir -p ~/Pictures
wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"

log_info "Configuring VNC xstartup..."
mkdir -p ~/.vnc
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
(sleep 8 && 
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s "$HOME/Pictures/cyberos-wallpaper.jpg" --create -t string &&
    xfconf-query -c xfwm4 -p /general/theme -s "Adwaita-dark" --create -t string &&
    xfdesktop --reload) &
EOF
chmod +x ~/.vnc/xstartup

log_info "CyberOS setup is complete!"
echo "[>] Launch using ./CyberOS [port]"
