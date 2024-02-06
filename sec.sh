#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sec.sh 
# 
#   DESCRIPTION:  Sub-rutina de seguretat
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
echo "***** SEGURETAT *****"
echo "a) Còpia de seguretat dels fitxers de sistema"
echo "b) Desencriptar fitxer"
echo "c) Ecriptar fitxer"
echo "d) Còpia de seguretat de KeePassXC - MEGA"
echo "e) Còpia de seguretat de MEGA - KeePassXC"
echo "f) Esborrar fitxer o carpeta de forma segura"
echo "g) Executar hBlock"
echo "h) Còpia de seguretat de Films"
echo "i) Actualitzar la base de dades de ClamAV"
echo "j) Anàl·lisi de seguretat"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Còpia de seguretat dels fitxers de sistema 
a)
cp /etc/fstab $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/minidlna.conf $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp -R /etc/apache2/sites-available $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp -R /etc/apache2/mods-available $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/default/grub $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/hosts $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/prelink.conf $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
sh $adr/sortida.sh
;;

############### Desencriptar fitxer
b)
ls -1 $PWD/*.gpg
echo -n "Introdueïx nom del fitxer a desencriptar ('q' per sortir): "
read filori
if [ "$filori" = "q" ]; then
  exit
fi
filenc=${filori%%.*}
gpg --output $filenc --decrypt $filori
sh $adr/sortida.sh
;;

############### Encriptar fitxer
c)
ls -1 $PWD
echo -n "Introdueïx nom del fitxer a encriptar ('q' per sortir): "
read filenc
if [ "$filenc" = "q" ]; then
  exit
fi
readonly filenca=$filenc".gpg"
#echo -n "E-Mail: "
#read mail
readonly correu="zonadart@autistici.org"
#read filori
gpg --output $filenca --encrypt --recipient $correu $filenc
#shred -u $filori
sh $adr/sortida.sh
;;

############### Còpia de seguretat de Keepassxc - MEGA
d)
rsync -vazh $HOME/.config/keepassxc/zonadart.kdbx $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/
rsync -vazh $HOME/.config/keepassxc/angels_db.kdbx $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/
rsync -vazh $HOME/.config/keepassxc/keepassxc.ini $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/
# rsync -vazh $HOME/.config/keepassxc/zonadart.kdbx /media/zonadart/EXTERNW/keepassxc/
sh $adr/sortida.sh
;;

############### Còpia de seguretat de MEGA - Keepassxc
e)
#rsync -vazh $HOME/.config/keepassxc/angels_db.kdbx $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
#rsync -vazh $HOME/.config/keepassxc/keepassxc.ini $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
#rsync -vazh $HOME/.config/keepassxc/angels_db.kdbx /media/zonadart/EXTERNW/keepassxc/
#mega-login angelsgomro@gmail.com MVNyvUC20v6S
#mega-cd documents/keepassxc/
#mega-rm angels_db.kdbx
#mega-put -c '/home/zonadart/.config/keepassxc/angels_db.kdbx'
#mega-ls
#mega-logout
rsync -vazh $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/zonadart.kdbx $HOME/.config/keepassxc/
rsync -vazh $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/angels_db.kdbx $HOME/.config/keepassxc/
rsync -vazh $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/keepassxc/keepassxc.ini $HOME/.config/keepassxc/
sh $adr/sortida.sh
;;

############### Esbmt=single-columnrrar fitxer de forma segura
f)
ls -1 $PWD
echo -n "Introdueïx nom del fitxer a esborrar ('q' per sortir): "
read caput
if [ "$caput" = "q" ]; then
  exit
fi
#shred -n 10 -uvz $caput
wipe -rfi $caput
sh $adr/sortida.sh
;;

############### Executar hBlock
g)
npx hblock
sh $adr/sortida.sh
;;

############### Copia seguretat de Films
h)
sh $adr/copsec.sh
#sh $adr/sortida.sh
;;

############### Actualitzar bases de dades de ClamAV
i)
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
sh $adr/sortida.sh
;;

############### Anàl·lisi de seguretat
j)
# Definición de la variable que almacena la ruta con el fichero de logs
# Como ruta se ha elegido el directorio /var/log
# El nombre del fichero contendrá la fecha de ejecución en formato YYYY-MM-DD
LOGFILE="/home/$USER/.scripts/security-check-$(date +'%Y-%m-%d').log";

# Añadir cabecera para los resultados de ClamAV en el fichero LOGFILE
echo -e "\n********** Resultat Anàl·lisi ClamAV **********\n" >> "$LOGFILE" 

# Ejecutar escaner con ClamAV y guardar resultado en el fichero LOGFILE
# El parámetro -r sirve para escanear directorios de forma recursiva
# El parámetro -i sirve para alertar unicamente de los ficheros infectados
# El parámetro --no-summary sirve para excluir el resumen final
# En este caso, hacemos el analisis sobre el directorio /home
sudo clamscan -r -i --no-summary /home >> "$LOGFILE";

# Añadir cabecera para los resultados de Chkrootkit en el fichero LOGFILE
echo -e "\n********** Resultat Anàl·lisi Chkrootkit **********\n" >> "$LOGFILE" 

# Ejecuta escaner con Chkrootkit y guardar resultado en el fichero LOGFILE
# El parámetro -q sirve para alertar solo de los warnings 
#sudo chkrootkit -q >> "$LOGDIR";
sudo chkrootkit -q >> "$LOGFILE";
# Añadir cabecera para los resultados de Rkhunter en el fichero LOGFILE
echo -e "\n********** Resultat Anàl·lisi Rkhunter **********\n" >> "$LOGFILE" 

# Ejecuta escaner con Rkhunter y guardar resultado en el fichero LOGFILE
# El parámetro -c de Rkhunter sirve para indicar la acción de realizar un escaneo
# El parámetro -rwo de Rkhunter sirve para alertar solo de los warnings
sudo rkhunter -c -rwo >> "$LOGFILE";

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
