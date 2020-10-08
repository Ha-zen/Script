#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255

> tmp.txt

Tsunami()
{
echo "toto"
}

Installyesno () {
dialog --title "Instalation de $1"\
  --backtitle "Vouler vous installer $1" \
  --yesno "OUI OU NON" 0 0
response=$?
case $reponse in
 0) dialog --title "Instalation de $1" \
	--msgbox "$1 s\'install" 0 0
 echo "$1" >> tmp.txt
  ;;
 1) dialog --title "Instalation de $1" \
	--msgbox "$1 ne sera pas installe" 0 0
  ;;
 255) dialog --title "Instalation de $1" \
	--msgbox "$1 ne sera pas installe" 0 0
  ;;
 esac
}

dialog --title "Programme-TP" \
	--msgbox "Bonjour, le programme suivant a pour fonction taratata..." 0 0

while true; do
	exec 3>&1
	selection=$(dialog \
	--backtitle "System Information" \
	--title "Menu" \
	--clear \
	--cancel-label "Exit" \
	--menu "Please select:" 0 0 4 \
	"1" "test_Musique" \
	"2" "Tsunami" \
	"3" "Cat2 prog1" \
	"4" "Cat2 Prog2" \
	2>&1 1>&3)
	exit_status=$?
	exec 3>&-
	case $exit_status in 
  $DIALOG_CANCEL)
   fin=$(cat ./tmp.txt)
		dialog --title "FIN_Programme-TP" \
	--msgbox "$fin" 0 0
    clear
		#echo "Program terminated."
		exit
	;;
	$DIALOG_ESC)
	      clear
	      echo "Program aborted." >&2
	      exit 1
      	;;
	esac

  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
dialog --clear --title "Mon chanteur franÃ§ais favori" \
	--menu "Bonjour, choisissez votre chanteur franÃ§ais favori :" 20 51 4 \
	 "Brel" "Jacques Brel" \
	 "Aznavour" "Charles Aznavour" \
 	 "Brassens" "Georges Brassens" \
	 "Nougaro" "Claude Nougaro" \
	 "Souchon" "Alain Souchon" \
	 "Balavoine" "Daniel Balavoine" 2> $fichtemp
valret=$?
choix=`cat $fichtemp`
case $valret in
 0)	dialog --title "Programme1.1-TP_reponse" \
        --msgbox "$choix est votre chanteur franÃ§ais préféré" 0 0
   echo "Test_musique" >> tmp.txt;;
 1) 	echo "Appuyé sur Annuler.";;
255) 	echo "Appuyé sur Echap.";;
esac
      ;;
    2 )
     Installyesno "Tsunami"    
      ;;
    3 )
    echo "Cat2 prog1" >> tmp.txt
    dialog --title "Programme-TP2.1_reponse" \
	--msgbox "blablabla" 0 0
      ;;
    4 )
    echo "Cat2 prog2" >> tmp.txt
    dialog --title "Programme-TP2.2_reponse" \
	--msgbox "blablabla" 0 0
  ;;
  esac
done
