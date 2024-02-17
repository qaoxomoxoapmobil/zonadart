#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sist.sh 
# 
#   DESCRIPTION:  Sub-rutina de sistema
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
echo "***** SISTEMA  *****"
echo "a) Actualitzar catxé de fonts"
echo "b) Llistat dels discs durs"
echo "c) Sistema de fonts infinality"
echo "d) Muntar o desmuntar ISO's al disc dur"
echo "e) Informació MAN d'un comande"
echo "f) Alliberar memòria RAM i SWAP"
echo "g) Optimitzar sistema"
echo "h) Activar server de python"
echo "i) Estat General de l'Ordinador"
echo "j) Borrar snaps"
echo "k) Desfragmentar disc dur"
echo "l) Conneixer l'estat de fragmentació d'un disc"
echo "m) Reconfigurar pulseaudio"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Actualitzar catxé de fonts
a)
sudo fc-cache -f -v
sh $adr/sortida.sh
;;

############### Llistat particions disc dur
b)
lsblk -f
sh $adr/sortida.sh
;;

###############  infinality
c)
sudo bash /etc/fonts/infinality/infctl.sh setstyle
sh $adr/sortida.sh
;;

########### Muntar i desmuntar ISO's al disc dur
d)
echo
echo "MENU"
echo "mnt) Muntar ISO"
echo "umnt) Desmuntar ISO"
echo "q) Sortir"
echo
read isoption
case $isoption in
mnt)
echo -n "Introdueïx el fitxer ISO ('q:' per sortir): "
read iso
if [ "$iso" = "q" ]; then
  exit
fi
sudo mount -t iso9660 -o loop $iso /media/zonadart/ISO/
echo
echo "ISO muntada correctament a /media/zonadart/ISO/"
sh $adr/sortida.sh
;;
umnt)
sudo umount /media/zonadart/ISO/
esac
sh $adr/sortida.sh
;;

###############  Manual simple de terminal
e)
echo -n "Introdueïx el nom del comande a consultar ('q' per sortir): "
read comande
if [ "$comande" = "q" ]; then
  exit
fi
# sudo apt install manpages-es
man --locale=es $comande
# LANG=es_ES.utf8 man $comande 
sh $adr/sortida.sh
;;

############### Alliberar memòria
f)
echo "<---------------------------------------------------------->"
echo "<---------------------------------------------------------->"

echo "Comprovant estat de memòria"
sudo free
echo "OK - Comprobació completada"
echo "<---------------------------------------------------------->"

sudo sleep 1s; echo “Neteja de memòria caché y swap“;
echo "<---------------------------------------------------------->"

sudo sleep 1s; echo "Deshabilitant Swap"
sudo swapoff -a
echo "OK - Swap deshabilitat"
echo "<---------------------------------------------------------->"

sudo sleep 2s; echo "Liberant pagecaches, dentries i inodes"
sudo sync;sudo sysctl -w vm.drop_caches=3;sudo sync
echo "OK - Server liberat"
echo "<---------------------------------------------------------->"

sudo sleep 3s; echo "Habilitant la Swap"
sudo swapon -a
echo "OK - Swap habilitat"
echo "<---------------------------------------------------------->"

sudo sleep 2s; sudo free
echo ".....TOT CORRECTE....."
echo "<---------------------------------------------------------->"
echo "<---------------------------------------------------------->"
sh $adr/sortida.sh
;;

############### prelink - https://ubunlog.com/mejora-el-funcionamiento-de-tu-sistema-y-aplicaciones-con-preload-y-prelink/
g)
sudo preload
sudo prelink -amvR
sh $adr/sortida.sh
;;

############### Activar server de python
h)
echo "Introdueïx al navegador" $HOSTNAME":9500"
echo "Per sortir, Ctrl+c"
python -m SimpleHTTPServer 9500
sh $adr/sortida.sh
;;

############### Estat General de l'Ordinador
i)
echo "=================================="
echo "Instal·la lm-sensors i hddtemp"
echo "=================================="
# Definim colors
export rojo='\033[0;31m'
export rojoI='\033[1;31m'
export rosaI='\033[1;35m'
export amarillo='\033[1;33m'
export cian='\033[1;36m'
export azul='\033[0;34m'
export verde='\033[1;32m'
export destaca='\033[1;38m'
export NC='\033[0m' # No Color
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo sensors
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo hddtemp /dev/sda
sudo hddtemp /dev/sdb
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo free -h
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo uptime
printf "${cian}"
echo "=================================="
printf "${NC}"
sh $adr/sortida.sh
;;

############### Borrar snaps
j)
sudo sh /opt/zonadart/borrar-snaps.sh
echo
sh $adr/sortida.sh
;;

############### Desfragmentar disc dur
k)
#sudo sh /opt/zonadart/desfrag.pl /home
sudo e4defrag /
echo
sh $adr/sortida.sh
;;

############### Conneixer l'estat de fragmentació d'un disc
l)
sudo sh /opt/zonadart/frag.pl /home
echo
sh $adr/sortida.sh
;;

############### Reconfigurar pulseaudio
m)
rm -r ~/.config/pulse; pulseaudio -k
echo
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

export rojo=''
export rojoI=''
export rosaI=""
export amarillo=''
export cian=''
export azul=''
export verde=''
export destaca=''
export NC=''
#done
