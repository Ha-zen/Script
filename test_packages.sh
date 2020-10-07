list_app=( "openssh-server" "nano" "sudo" "nmap" )

for pkg in ${list_app[@]}; do

    #PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg |grep "install ok installed" )
    pkg_ok=$(dpkg-query -W -f='${Status}' $pkg | awk '{print $3}')

    echo Checking for $pkg: $pkg_ok

    if [ "${pkg_ok}" == "installed" ]; then

      echo -e "No need to install $pkg $(dpkg-query -W -f='- ${version}' $pkg)" >> installed_pkg

    else
	    echo " Install le PUTAIN de $pkg" >> non_installed_pkg

    fi
done


