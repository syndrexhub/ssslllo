#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
		echo "Jalankan Scrip Dalam Direktori Root Mode"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ Tidak Didukung!"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Sudah Terinstall!!"
fi
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt update
apt install -y bzip2 gzip coreutils screen curl

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf

#Cloudflare
figlet -f slant Install CLOUDFLARE | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/domain.sh && dos2unix domain.sh && chmod +x domain.sh && ./domain.sh
#SSH OVPN
figlet -f slant Install SSH OVPN | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/ssh-vpn/ssh-vpn.sh && dos2unix ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#SSTP
figlet -f slant Install SSTP | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/sstp.sh && dos2unix sstp.sh && chmod +x sstp.sh && ./sstp.sh
#SSR
figlet -f slant Install SSR | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/ssr.sh && dos2unix ssr.sh && chmod +x ssr.sh && ./ssr.sh
#SODOSOK
figlet -f slant Install SHADOWSOCKS | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sadosok/sodosok.sh && dos2unix sodosok.sh && chmod +x sodosok.sh && ./sodosok.sh
#WG
figlet -f slant Install WIREGUARD | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Wireguard/wg.sh && dos2unix wg.sh && chmod +x wg.sh && ./wg.sh
#V2RAY
figlet -f slant Install V2RAY | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/v2ray/v2ray.sh && dos2unix v2ray.sh && chmod +x v2ray.sh && ./v2ray.sh
#TROJAN-GO
figlet -f slant Install TROJAN-GO | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Trojan-go/trojango.sh && dos2unix trojango.sh && chmod +x trojango.sh && ./trojango.sh
#L2TP
figlet -f slant Install L2TP | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/L2tp/ipsec.sh && dos2unix ipsec.sh && chmod +x ipsec.sh && ./ipsec.sh
#SET-BR
figlet -f slant Install SET-BR | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/set-br/set-br.sh && dos2unix set-br.sh && chmod +x set-br.sh && ./set-br.sh
#BAHAN
figlet -f slant Install BAHAN | lolcat
wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/install.sh && dos2unix install.sh && chmod +x install.sh && ./install.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://premium-server.xyz
[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/set.sh"
chmod +x /etc/set.sh
sleep 0.5
#wget https://raw.githubusercontent.com/Afdhan/CDN/main/A/I/U/E/O/uwwu.sh && chmod +x uwwu.sh && ./uwwu.sh
history -c
echo "1.1.1" > /home/ver
clear
echo " "
echo " "
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service Port" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 567, 171"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - WebSocket Dropbear      : 8880"  | tee -a log-install.txt
echo "   - WebSocket OpenSSH       : 2095"  | tee -a log-install.txt
echo "   - WebSocket OpenVPN       : 2082"  | tee -a log-install.txt
echo "   - WebSocket TLS           : 443"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP SSH)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 2052"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
exho "   - TrojanGo           : 2096" | tee -a log install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00-12.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo ""
sleep 1
if [ ! -e /root/log-install.txt ]; then
  echo -e "Setup Install Bermasalah! Sistem Akan Membuat Direktori Pengulangan" | lolcat
  sleep 0.5
  wget https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/log.sh && dos2unix log.sh && chmod +x log.sh && ./log.sh
  else
  echo -e "Setup Install Sukses!" | lolcat
fi
echo " Reboot 10 Detik"
sleep 10
rm -f gaskeun.sh
reboot
