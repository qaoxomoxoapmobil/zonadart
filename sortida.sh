#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sortida.sh 
# 
#   DESCRIPTION:  Sub-rutina de sortida
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

echo
echo -n "Pulsa 'r' per menú principal (qualsevol tecla per sortir): "
	read return
case $return in
	r)
		sh $adr/zonadart
;;

	*)
		export adr=" " && exit
esac

