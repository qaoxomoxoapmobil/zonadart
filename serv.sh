#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./serv.sh 
# 
#   DESCRIPTION:  Sub-rutina de servidors
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
set -e
set -u

clear
#while :
#do
echo "M E N U :"
echo "========="
echo
echo "***** SERVIDORS *****"
echo "a) Arrancar servidor FTP"
echo "b) Estat del servidor FTP"
echo "c) Parar servidor FTP"
echo "d) Arrancar servidor HTTPS"
echo "e) Estat del servidor HTTPS"
echo "f) Parar servidor HTTPS"
echo "g) Arrancar servidor MINIDLNA"
echo "h) Estat del servidor MINIDLNA"
echo "i) Parar servidor MINIDLNA"
echo "j) wagtail"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

################################################# Arrancar servidor MINIDLNA
g)
sudo systemctl start minidlna.service
echo
echo "Servidor MINIDLNA arrancat correctament"
sh $adr/sortida.sh
;;
############### Estat del servidor MINIDLNA
h)
sudo systemctl status minidlna.service
echo
sh $adr/sortida.sh
;;
############### Parar servidor MINIDLNA
i)
sudo systemctl stop minidlna.service
echo
echo "Servidor MINIDLNA aturat correctament"
sh $adr/sortida.sh
;;
################################################# Wagtail
j)
# su
sudo su - zonadart
source ~/wagtailvenv/bin/activate
cd newproject
python manage.py runserver 0.0.0.0:8000
sh $adr/sortida.sh
;;
################################################# Arrancar servidor HTTPS
d)
sudo systemctl start apache2.service
echo
echo "Servidor HTTPS arrancat correctament"
sh $adr/sortida.sh
;;
############### Estat del servidor HTTPS
e)
sudo systemctl status apache2.service
sh $adr/sortida.sh
;;
############### Parar servidor HTTPS
f)
sudo systemctl stop apache2.service
echo
echo "Servidor HTTPS aturat correctament"
sh $adr/sortida.sh
;;
############### Arrancar servidor FTP
a)
sudo systemctl start proftpd.service
echo
echo "Servidor FTP arrancat correctament"
sh $adr/sortida.sh
;;

############### Estat del servidor FTP
b)
sudo systemctl status proftpd.service
sh $adr/sortida.sh
;;
############### Parar servidor FTP
c)
sudo systemctl stop proftpd.service
echo
echo "Servidor FTP aturat correctament"
sh $adr/sortida.sh
;;

###########################################################
q)
sh $adr/sortida.sh
;;
########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
#done
