#!/bin/bash/
# IFS=
# declare -a liste=( "ssh" "nmap" )
# dpkg-query -W -f='${Status}' $liste | grep -q -P '^install ok installed$'; echo $?
# T=$(ps -el | awk '{print $14}' | awk 'NR>2')
# # echo "${T}"
# for value in ${T}
#     do echo "${value}"
#     # liste=(${value})  
# done
# echo ${liste[@]}
array=( one two three four )
echo ${array[@]}