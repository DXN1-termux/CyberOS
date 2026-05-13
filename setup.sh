#!/bin/bash

# CyberOS Setup Script
# Automatically installs XFCE, VNC, and a massive arsenal of security tools

echo -e "\033[1;34m[+] Welcome to CyberOS Setup\033[0m"
echo "[+] Detecting package manager and installing dependencies..."

if [ -x "$(command -v apt-get)" ]; then
    # Debian/Ubuntu
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
        xfce4 xfce4-goodies tightvncserver firefox wireshark default-jre \
        wget curl net-tools nmap sqlmap gobuster dirb hydra wfuzz seclists \
        john aircrack-ng tmux git python3-pip
elif [ -x "$(command -v pacman)" ]; then
    # Arch based
    sudo pacman -Sy --noconfirm \
        xfce4 xfce4-goodies tigervnc firefox wireshark-qt jre-openjdk \
        wget curl net-tools nmap sqlmap gobuster dirb hydra \
        john aircrack-ng tmux git python-pip \
        subfinder httpx nuclei \
        metasploit-framework hashcat burpsuite zaproxy gimp \
        nikto masscan enum4linux smbmap ldapsearch dnsrecon \
        ffuf gf anew assetfinder gospider feroxbuster
else
    echo -e "\033[1;31m[-] Unsupported OS or package manager. Manual install required.\033[0m"
    exit 1
fi

echo -e "\033[1;34m[+] Optimizing XFCE for performance...\033[0m"
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
# Disable compositing and desktop icons to save resources
xfconf-query -c xfwm4 -p /general/use_compositing -s false --create -t bool
xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 --create -t int

echo -e "\033[1;34m[+] Setting up Burp Suite Community Edition...\033[0m"
if [ ! -f "burpsuite.jar" ]; then
    wget -qO burpsuite.jar "https://portswigger-cdn.net/burp/releases/download?product=community&version=2024.2.1&type=Jar"
fi

# Ensure Burpsuite is easily accessible
if [ ! -f /usr/local/bin/burpsuite ]; then
    echo -e '#!/bin/bash\njava -jar '"$(pwd)"'/burpsuite.jar "$@"' | sudo tee /usr/local/bin/burpsuite > /dev/null
    sudo chmod +x /usr/local/bin/burpsuite
fi

echo -e "\033[1;34m[+] Fetching Custom CyberOS Wallpaper...\033[0m"
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
mkdir -p ~/Pictures
wget -qO ~/Pictures/cyberos-wallpaper.jpg "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080"
# XFCE script to set wallpaper will run on first boot

echo -e "\033[1;34m[+] Configuring VNC xstartup for XFCE...\033[0m"
mkdir -p ~/.vnc
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
# Ensure XFCE loads with a clean slate
startxfce4 &

# Wait for XFCE to initialize the session, then apply custom theme settings
(sleep 8 && 
    # Set Wallpaper
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s "$HOME/Pictures/cyberos-wallpaper.jpg" --create -t string &&
    # Enable Cyberpunk transparency/theme tweaks
    xfconf-query -c xfwm4 -p /general/theme -s "Adwaita-dark" --create -t string &&
    # Refresh Desktop
    xfdesktop --reload) &
EOF
chmod +x ~/.vnc/xstartup

echo -e "\033[1;32m[+] CyberOS setup is complete!\033[0m"
echo "[>] You can now launch your desktop using ./CyberOS [port]"
