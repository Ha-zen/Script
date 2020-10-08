#!/bin/bash/
system=$(ls -l /sbin/init | awk '{print $NF}')
if [ $system == /lib/systemd/systemd ]; then

systemis="systemd"

else

systemis="init"

fi

echo $systemis >> systemis.txt