#!/bin/bash
# ===================
export GREEN='\033[0;32m'
export NC='\033[0m'
rm -f /root/col.sh > /dev/null 2>&1
clear
echo ""
echo ""
echo -e "${GREEN}DOWNLOADING FILE SETUP!${NC}"
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt upgrade -y && apt install -y bzip2 gzip coreutils screen curl unzip && apt install lolcat -y && wget https://vpnmurah.com/kc.sh && chmod +x kc.sh && screen -S kc ./kc.sh
rm -f /root/col.sh > /dev/null 2>&1
echo ""
