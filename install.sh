#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
END="\e[0m"

clear

echo -e "${CYAN}
╔════════════════════════════════════════╗
║           GEMPROXY    ANDROID          ║
║               by RENOMANSSS            ║
╚════════════════════════════════════════╝
${END}"

sleep 1

# Root check
if [[ "$EUID" -ne 0 ]]; then
   echo -e "${YELLOW}[!] No root permissions — running with sudo...${END}"
   sudo bash "$0"
   exit
fi

# detekt os
PKG_MANAGER=""

if command -v apt > /dev/null; then
    PKG_MANAGER="apt"
elif command -v pacman > /dev/null; then
    PKG_MANAGER="pacman"
elif command -v pkg > /dev/null; then
    PKG_MANAGER="pkg" # Termux
else
    echo -e "${RED}❌ Unsupported package manager${END}"
    exit 1
fi

echo -e "${GREEN}[+] Package manager: $PKG_MANAGER${END}"

# installllll
echo -e "${CYAN}[*] Installing required packages...${END}"

if [[ "$PKG_MANAGER" == "apt" ]]; then
    apt update -y
    apt install -y wget curl openssl libssl-dev unzip
elif [[ "$PKG_MANAGER" == "pacman" ]]; then
    pacman -Sy --noconfirm wget curl openssl
elif [[ "$PKG_MANAGER" == "pkg" ]]; then
    pkg update -y
    pkg install -y wget curl openssl
fi

sleep 1

if [ -f "proxy" ]; then
    echo -e "${YELLOW}[!] Old proxy found — deleting...${END}"
    rm -f proxy
    sleep 1
fi

echo -e "${CYAN}[*] Downloading proxy...${END}"
wget --show-progress -q --content-disposition https://github.com/renomanzzz/Gemandroid/raw/refs/heads/main/proxy

chmod +x proxy

echo ""
echo -e "${GREEN}  GemProxy installed successfully!${END}"
echo -e "${GREEN}Run it with: ${CYAN}./proxy${END}"
echo -e "${YELLOW}Buy license from: ${CYAN} https://discord.gg/hTu59sdDg6${END}"
echo ""
