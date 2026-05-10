#!/bin/bash

# CyberOS Setup Script
# Automatically installs XFCE, VNC, Firefox, Wireshark, and Burp Suite

echo -e "\033[1;34m[+] Welcome to CyberOS Setup\033[0m"
echo "[+] Detecting package manager and installing dependencies..."

if [ -x "$(command -v apt-get)" ]; then
    # Debian/Ubuntu
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 xfce4-goodies tightvncserver firefox wireshark default-jre wget curl net-tools
elif [ -x "$(command -v pacman)" ]; then
    # Arch based
    sudo pacman -Sy --noconfirm xfce4 xfce4-goodies tigervnc firefox wireshark-qt jre-openjdk wget curl net-tools
else
    echo -e "\033[1;31m[-] Unsupported OS or package manager. Please install XFCE, VNC, and Java manually.\033[0m"
    exit 1
fi

echo -e "\033[1;34m[+] Setting up Burp Suite Community Edition...\033[0m"
if [ ! -f "burpsuite.jar" ]; then
    wget -qO burpsuite.jar "https://portswigger-cdn.net/burp/releases/download?product=community&version=2024.2.1&type=Jar"
fi

# Ensure Burpsuite is easily accessible
if [ ! -f /usr/local/bin/burpsuite ]; then
    echo -e '#!/bin/bash\njava -jar '"$(pwd)"'/burpsuite.jar "$@"' | sudo tee /usr/local/bin/burpsuite > /dev/null
    sudo chmod +x /usr/local/bin/burpsuite
fi

echo -e "\033[1;34m[+] Configuring VNC xstartup for XFCE...\033[0m"
mkdir -p ~/.vnc
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup

echo -e "\033[1;32m[+] CyberOS setup is complete!\033[0m"
echo "[>] You can now launch your desktop using ./CyberOS [port]"
