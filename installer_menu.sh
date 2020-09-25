#!/bin/bash/

# : ${DIALOG_OK=0}
# : ${DIALOG_CANCEL=1}
# : ${DIALOG_HELP=2}
# : ${DIALOG_EXTRA=3}
# : ${DIALOG_ITEM_HELP=4}
# : ${DIALOG_ESC=255}

#tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/test$$
#trap "rm -f $tmp_file" 0 1 2 5 15




# declare -a liste=( "openssh-server" "sudo" )
# dpkg-query -W -f='${Status}' $liste


# for pkg in ${liste[@]}; do
#     dpkg-query -W -f='${Status}' $pkg | grep -q -P '^install ok installed$'; echo $? 

# if [$? == 0]
#   $onoff="on"
#   else
#   $onoff="off"

# dialog --checklist "Select:" 10 50 5 \
#   1 "sudo" $onoff  \
#   2 "openssh-server" off \
#   3 "Third element" off

# done

whiptail --title "titre" --infobox "Ceci est un message" 8 78



# dialog --title "Installation" --checklist "test" 0 0 0  1 Attack 2 Defense 3 Forensic 4 Admin 5 Anonym

# dialog --title "Menu! " --column-separator "|" --menu "" 0 0 0 "1" "INFO|INSTALLE|CONTENEURISE|LANCE|BOOT" "2" "Option|Two" "3" "Option|Three" "4" "Option|Four"


# dialog --title " Welcome to My Menu! " \
      --column-separator "|"          \
      --checklist "" 6 0 0              \
              "1" "Option One | 1-2 buckle my shoe"        \
              "2" "Option Two | Old MacDonald had a farm"        \
              "3" "Option Three | Jack and Jill went up a hill"      \
              "4" "Option Four | Old King Cole was a merry old soul"       \
  
