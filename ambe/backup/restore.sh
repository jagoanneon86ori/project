#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Adit Ardiansyah
# (C) Copyright 2022
# =========================================

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8' > /dev/null
export LANG='en_US.UTF-8' > /dev/null
export LANGUAGE='en_US.UTF-8' > /dev/null
export LC_CTYPE='en_US.utf8' > /dev/null

# // Export Color & Information
export RED='\033[0;31m'
export green='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} ERROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="raw.githubusercontent.com/jaka1m/project/main"
export Server_URLL="raw.githubusercontent.com/jaka1m/perizinan/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="geovpn"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -sS ipinfo.io/ip )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Validate Result ( 1 )
touch /etc/${Auther}/license.key
export Your_License_Key="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Validated_Your_License_Key_With_Server="$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 1 )"
if [[ "$Validated_Your_License_Key_With_Server" == "$Your_License_Key" ]]; then
    validated='true'
else
    echo -e "${EROR} License Key Not Valid"
    exit 1
fi

# // Checking VPS Status > Got Banned / No
if [[ $IP == "$( curl -s https://${Server_URLL}/blacklist.txt | cut -d ' ' -f 1 | grep -w $IP | head -n1 )" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your VPS Has Been Banned )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ $Your_License_Key == "$( curl -s https://${Server_URLL} | cut -d ' ' -f 1 | grep -w $Your_License_Key | head -n1)" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your License Has Been Limited )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ 'Standart' == "$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 8 )" ]]; then 
    License_Mode='Standart'
elif [[ Pro == "$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 8 )" ]]; then 
    License_Mode='Pro'
else
    echo -e "${EROR} Please Using Genuine License !"
    exit 1
fi

# // Checking Script Expired
exp=$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | cut -d ' ' -f 4 )
now=`date -d "0 days" +"%Y-%m-%d"`
expired_date=$(date -d "$exp" +%s)
now_date=$(date -d "$now" +%s)
sisa_hari=$(( ($expired_date - $now_date) / 86400 ))
if [[ $sisa_hari -lt 0 ]]; then
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
    echo -e "${EROR} Your License Key Expired ( $sisa_hari Days )"
    exit 1
else
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
fi
clear
cd
mimpi=$(curl -sS ipv4.icanhazip.com);
#export NameUser=$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | cut -d ' ' -f 9-100 | awk '{print $1}' );
#NameUser=$(curl -sS https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | cut -d ' ' -f 9-100 | awk '{print $1}' );
cekdata=$(curl -sS https://raw.githubusercontent.com/jaka1m/backup-full/main/$mimpi/$mimpi.zip | grep 404 | awk '{print $1}' | cut -d: -f1)
[[ "$cekdata" = "404" ]] && {
red "Data not found / you never backup"
exit 0
} || {
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m    ⇱ RESTORE DATA VPS ⇲      \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
#green "Data found for username ${NameUser}"
}
echo -e "[ ${green}INFO${NC} ] • Restore Data..."
read -rp "Password File: " -e InputPass
echo -e "[ ${green}INFO${NC} ] • Downloading data.."
mkdir /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/jaka1m/backup-full/main/$mimpi/$mimpi.zip" &> /dev/null
echo -e "[ ${green}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[ ${green}INFO${NC} ] • Starting to restore data..."
rm -f /backup.zip &> /dev/null
sleep 1
echo Start Restore
cd /root/backup &> /dev/null
cp passwd /etc/ &> /dev/null
cp group /etc/ &> /dev/null
cp shadow /etc/ &> /dev/null
cp gshadow /etc/ &> /dev/null
cp -r wireguard /etc/ &> /dev/null
cp chap-secrets /etc/ppp/ &> /dev/null
cp passwd1 /etc/ipsec.d/passwd &> /dev/null
cp ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
cp -r geovpnstore /var/lib/ &> /dev/null
cp -r sstp /home/ &> /dev/null
cp -r xray /etc/ &> /dev/null
cp -r trojan-go /etc/ &> /dev/null
cp -r shadowsocksr /usr/local/ &> /dev/null
cp -r public_html /home/vps/ &> /dev/null
cp crontab /etc/ &> /dev/null
strt &> /dev/null
rm -rf /root/backup &> /dev/null
rm -f backup.zip &> /dev/null
echo
echo -e "[ ${green}INFO${NC} ] • RESTORE DATA SUKSES..."
echo
read -n 1 -s -r -p "Press any key to back on menu"
system-menu
