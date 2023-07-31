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
export GREEN='\033[0;32m'
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
mimpi=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")

MYIP=$(curl -sS ipv4.icanhazip.com)
#NameUser=$(curl -sS https://${Server_URLL}/validated-registered-license-key.txt | grep $MYIP | awk '{print $2}')
#export NameUser=$( curl -s https://${Server_URLL}/validated-registered-license-key.txt | grep -w $Your_License_Key | cut -d ' ' -f 9-100 | awk '{print $1}' );

clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m    ⇱ BACKUP DATA VPS ⇲       \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "[ ${GREEN}INFO${NC} ] Create password for database"
read -rp "Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${GREEN}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp /etc/shadow /root/backup/ &> /dev/null
cp /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/wireguard /root/backup/wireguard &> /dev/null
cp /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
cp /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf &> /dev/null
cp -r /var/lib/geovpnstore/ /root/backup/geovpnstore &> /dev/null
cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $mimpi.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/jaka1m/backup-full.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$mimpi
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$mimpi/$mimpi-last-backup" ]; then
touch /root/user-backup/$mimpi/$mimpi-last-backup
fi
echo -e "User         : $mimpi
last-backup : $LLatest
" >> /root/user-backup/$mimpi/$mimpi-last-backup
mv /root/$mimpi.zip /root/user-backup/$mimpi/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "ambebalong@gmail.com" &> /dev/null
    git config --global user.name "jaka1m" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/jaka1m/backup-full
    git push -f https://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@github.com/jaka1m/backup-full.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/jaka1m/backup-full/main/$mimpi/$mimpi.zip"
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Backup done "
sleep 1
echo
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Generete Link Backup "
echo
sleep 2
echo -e "The following is a link to your vps data backup file.
Your VPS IP $IP

$link
save the link pliss!

If you want to restore data, please enter the link above.
Thank You For Using Our Services"

rm -rf /root/backup &> /dev/null
rm -rf /root/user-backup &> /dev/null
rm -f /root/$mimpi.zip &> /dev/null
echo
read -n 1 -s -r -p "Press any key to back on menu"
system-menu