#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255



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
	"1" "Cat1 prog1" \
	"2" "Cat1 prog2" \
	"3" "Cat2 prog1" \
	"4" "Cat2 Prog2" \
	2>&1 1>&3)
	exit_status=$?
	exec 3>&-
	case $exit_status in $DIALOG_CANCEL)
		dialog --title "FIN_Programme-TP" \
	--msgbox "Programme Fini" 0 0
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
        --msgbox "$choix est votre chanteur franÃ§ais préféré" 0 0;;
 1) 	echo "Appuyé sur Annuler.";;
255) 	echo "Appuyé sur Echap.";;
esac
      ;;
    2 )
      dialog --title "Programme-TP1.1" \
	--msgbox "blablabla" 0 0
      ;;
    3 )
    dialog --title "Programme-TP2.1_reponse" \
	--msgbox "blablabla" 0 0
      ;;
    4 )
        dialog --title "Programme-TP2.2_reponse" \
	--msgbox "blablabla" 0 0
  esac
done
