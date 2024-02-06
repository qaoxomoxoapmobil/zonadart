#!/bin/bash - 
#===============================================================================
#
#          FILE:  install.sh
# 
#         USAGE:  ./install.sh 
# 
#   DESCRIPTION:  Instal·lador del programa zonadart
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonarte31@gmail.com
#       COMPANY: Zona d_Art
#       CREATED: 16/12/14 13:52:47 CET
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -eu
# IF DEBIAN
# if [ -e "/etc/debian_version" ]; then
    echo "Copiant zonadart a /opt/zonadart ..."
    # check for older version
    id=zonadart
#    if [ -d "/opt/zonadart/" ]; then
				sudo rm -f /usr/local/bin/zonadart
        sudo rm -rf /opt/zonadart
#    fi
    # install essential files
    sudo mkdir /opt/zonadart/
    sudo chown -R zonadart:zonadart /opt/zonadart/
    sudo cp zonadart /opt/zonadart/
		sudo cp borrar-snaps.sh /opt/zonadart/
		sudo cp desfrag.pl /opt/zonadart/
		sudo cp frag.pl /opt/zonadart/
		sudo cp compt.sh /opt/zonadart/
		sudo cp repo.sh /opt/zonadart/
		sudo cp sec.sh /opt/zonadart/
		sudo cp copsec.sh /opt/zonadart
		sudo cp serv.sh /opt/zonadart/
		sudo cp sist.sh /opt/zonadart/
		sudo cp xarx.sh /opt/zonadart/
		sudo cp util.sh /opt/zonadart/
		sudo cp sortida.sh /opt/zonadart/
		sudo chown zonadart:zonadart /opt/zonadart/*
    sudo chmod 755 /opt/zonadart/*
    sudo ln -s /opt/zonadart/zonadart /usr/local/bin/zonadart
# fi
echo
echo "Instal·lació completa. Es pot tancar aquest terminal."
sleep 2
