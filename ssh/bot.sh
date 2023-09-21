#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

clear
#install
rm -rf /home/geovpn
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite3 -y
wget https://jaka1m.github.io/project/ssh/geovpn.zip
unzip geovpn.zip > /dev/null
mv geovpn /home
rm -f geovpn.zip
#mv * /home/
cd /home/geovpn
rm var.txt
rm database.db
pip3 install -r requirements.txt
pip install pillow
pip install speedtest-cli
#isi data
clear
geol=$(cat /etc/xray/ns.txt)
domain=$(cat /etc/xray/domain)
echo "INSTALL BOT CREATE SSH via TELEGRAM"
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your bot Telegram :" token


echo -e BOT_TOKEN='"'$token'"' >> /home/geovpn/var.txt
echo -e ADMIN='"'$admin'"' >> /home/geovpn/var.txt
echo -e DOMAIN='"'$domain'"' >> /home/geovpn/var.txt
echo -e DNS='"'$geol'"' >> /home/geovpn/var.txt
echo -e PUB='"7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"' >> /home/geovpn/var.txt

cat > /etc/systemd/system/geovpn.service << END
[Unit]
Description=Simple geovpn - @geovpn
After=network.target

[Service]
WorkingDirectory=/home
ExecStart=/usr/bin/python3 -m geovpn
Restart=always

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl enable geovpn
systemctl start geovpn
systemctl restart geovpn

wget -O ~/menu.zip "https://raw.githubusercontent.com/jaka1m/project/main/ssh/menu.zip"
    mkdir /root/menu
    7z e -psumbawa   ~/menu.zip -o/root/menu/
    chmod +x /root/menu/*
    mv /root/menu/* /usr/local/sbin/
    rm -r /root/menu
    rm -r /root/menu.zip
clear
echo "Your Data Bot"
echo -e "==============================="
echo "Api Token     : $token"
echo "ID            : $admin"
echo "DOMAIN        : $domain"
echo -e "==============================="

echo " Installations complete, type /menu on your bot "
rm -rf /root/geovpn.zip
