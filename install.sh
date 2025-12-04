#!/data/data/com.termux/files/usr/bin/bash

RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
END="\e[0m"

clear

echo -e "${CYAN}
╔════════════════════════════════════════╗
║      GEMPROXY ANDROID - TERMUX         ║
║            by RENOMANSSS               ║
╚════════════════════════════════════════╝
${END}"

sleep 1

echo -e "${CYAN}[*] Updating packages...${END}"
pkg update -y && pkg upgrade -y

echo -e "${CYAN}[*] Installing dependencies...${END}"
pkg install -y wget curl openssl unzip

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
echo -e "${GREEN}✅ GemProxy installed successfully on Termux!${END}"
echo -e "${GREEN}Run it using: ${CYAN}./proxy${END}"
echo -e "${YELLOW}Buy license from: ${CYAN}https://discord.gg/hTu59sdDg6${END}"
echo ""
