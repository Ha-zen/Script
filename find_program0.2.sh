#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" )
# dpkg-query -W -f='${Status}' $liste


for pkg in ${liste[@]}; do
    dpkg-query -W -f='$liste[@] - ${version} - ${Status}\n' $pkg
done


# echo ${liste[@]}