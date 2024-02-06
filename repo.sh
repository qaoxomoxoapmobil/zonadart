#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./repo.sh 
# 
#   DESCRIPTION:  Sub-rutina de repositoris
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
echo "***** REPOSITORIS I APT *****"
echo "a) Asegurar l'autenticitat dels servidors d'actualització de Debian"
echo "b) Netejar fitxers de configuració de paquets desinst"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

###############  Asegurar l'autenticitat dels servidors d'actualització de Debian
a)
echo -n "introdueïx codi GPG error ('q' per sortir): "
read code
if [ "$code" = "q" ]; then
  exit
fi
gpg --keyserver pgpkeys.mit.edu --recv-key $code
gpg -a --export $code | sudo apt-key add -
echo "Clau GPG actualitzada"
sh $adr/sortida.sh
;;

############### Purgar fitxer de configuració
b)
#sudo dpkg --purge `COLUMNS=300 dpkg -l | egrep "^rc" | cut -d' ' -f3`
#echo "Fitxers purgats correctament"
# Desinstalar paquetes no necesarios
sudo apt -y autoremove

# Obtener paquetes marcados para ser desinstalados aun presentes en el sistema
#paquetes=$(sudo dpkg --set-selections | deinstall)

# Eliminar los paquetes obtenidos como resultado del comando anterior
#echo "$paquetes" | awk '{print $s1}' | xargs sudo apt purge -y

# Limpiar archivos de configuración de paquetes paquetes desinstalados
sudo apt autoclean
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
