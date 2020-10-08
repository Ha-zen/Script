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

        echo -e "No need to install $pkg $(dpkg-query -W -f='- ${version}' $pkg)" >> installed_pkg

    else
        echo " Install de $pkg" >> non_installed_pkg

    fi
done

# Page d'introduction
echo "vous utilisez $systemis"
# installation-désintallation



# Résume des programmes

# liste des programmes
# for i in non_installed_pkg; do




