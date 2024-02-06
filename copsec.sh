#!/bin/bash - 
#===============================================================================
#
#          FILE:  copsec.sh
# 
#         USAGE:  ./copsec.sh 
# 
#   DESCRIPTION:  Sub-rutina de còpies de seguretat
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 17/08/21 11:49:04 CEST
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
echo "***** FILMS *****"
echo "a1) Còpia de seguretat de 'FILMS'"
echo "a2) Còpia de seguretat incremental de 'FILMS'"
echo "a3) Recupera 'FILMS'"
echo
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############## FILMS
a1)
duplicity full /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS incremental
a2)
duplicity incremental /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS recupera
a3)
duplicity file:///media/zonadart/EXTERN/films_bak recupera_films

sh $adr/sortida.sh
;;

################################################# Sortir
q)
sh $adr/sortida.sh
;;
########### Opció invàlida
############## FILMS
f1)
duplicity /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS incremental
f2)
duplicity incremental /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS recupera
f3)
duplicity file:///media/zonadart/EXTERN/films_bak recupera_films

sh $adr/sortida.sh
;;*)
echo Opció invàlida
###########################################################
esac
