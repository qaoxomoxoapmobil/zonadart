#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./xarx.sh 
# 
#   DESCRIPTION:  Sub-rutina de xarxes
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 03/07/18 11:49:04 CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -eu

clear
#while :
#do
echo "M E N U :"
echo "========="
echo
echo "***** XARXES *****"
echo "a) Demanar informació de web"
echo "b) Mostrar IP pública i privada"
echo "c) Càlcul de xarxes"
echo "d) Configurar network manager"
echo "e) Veure llistat d'ordinadors conectats a la xarxa"
echo "f) Actualitzar FreshRSS"
echo "g) Velocitat d'internet"
echo "h) RSS al terminal"
echo "i) Termshark (Interactive Wireshark)"
echo "j) Ample de banda d'aplicacions"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in
############### Ample de banda d'aplicacions
j)
sudo nethogs 
sh $adr/sortida.sh
;;

############### Termshark (Interactive Wireshark)
i)
 termshark 
sh $adr/sortida.sh
;;

############### RSS al terminal
h)
 newsbeuter 
sh $adr/sortida.sh
;;


############### Demanar informació
a)
echo -n "Introdueïx de què vols web la informació ('q' per sortir): "
read clifiy
if [ "$clifiy" = "q" ]; then
    exit
  fi
  curl cli.fyi/$clifiy
sh $adr/sortida.sh
;;

############### Actualitzar FreshRSS
f)
echo "Actualitzar FreshRSS"
echo
sudo php /home/$USER/public_html/FreshRSS/FreshRSS-master/cli/actualize-user.php --user $USER
sh $adr/sortida.sh
;;
 
###########Ip de xarxa
b)
echo "IP LAN: "
#exec /sbin/ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'
hostname -I
echo
echo "IP WAN: "
# exec wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
sh $adr/sortida.sh
;;

########## Càlculs de xarxes
c)
echo -n "Introdueïx la ip de xarxa ('q:' per sortir): "
read ip
if [ "$ip" = "q" ]; then
  exit
fi
echo -n "Introdueïx la subnet ('q:' per sortir): "
read sn
if [ "$sn" = "q" ]; then
  exit
fi
ipcalc $ip/$sn
echo "-----------------------------------"
sipcalc $ip/$sn
sh $adr/sortida.sh
;;

############### Configurar Networtk-Manager
d)
sudo nm-connection-editor
sh $adr/sortida.sh
;;

############### LLISTAT D'ORDINADORS
e)
sudo nmap -sP 192.168.1.1/24 | grep down -v
sh $adr/sortida.sh
;;

############### Velocitat d'Internet
g)
#speedtest-cli
cd /home/zonadart/bin/speedtest/
./speedtest
sh $adr/sortida.sh
;;

################################################# Sortir
q)
sh $adr/sortida.sh
;;
########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
#done
