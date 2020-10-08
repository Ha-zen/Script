#!/bin/bash/

# appelle un la variable qui contient le type de système d'initialisation
. fonctions.sh
#check_os=$(uname -ar)

declare -a liste=( "openssh-server" "sudo" "tsunami" "nessus" "docker" )

for pkg in ${liste[@]}; do
    
    check_pkg=$(dpkg-query -W -f='${Status}' $pkg 2>/dev/null | awk '{print $3}' )
    version_pkg=$(dpkg-query -W -f=' - ${version}' $pkg 2>/dev/null )

    echo Checking for $pkg: $check_pkg

    if [ "${check_pkg}" == "installed" ]; then

        echo -e "No need to install $pkg $(dpkg-query -W -f='- ${version}' $pkg)" >> /tmp/installed_pkg

    else
        echo "Install de $pkg" >> /tmp/non_installed_pkg

    fi
done

# Page d'introduction
echo "vous utilisez $systemis"
# installation-désintallation



# Résume des programmes

# liste des programmes
let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
done < <( more /tmp/liste )
FILE=$(dialog --title "List file of directory /home" --menu "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
clear



if [ $? -eq 0 ]; then # Exit with OK
    readlink -f $(more /tmp/liste | sed -n "echo "$FILE p" | sed 's/ //'")
fi





