#!/bin/bash/

# : ${DIALOG_OK=0}
# : ${DIALOG_CANCEL=1}
# : ${DIALOG_HELP=2}
# : ${DIALOG_EXTRA=3}
# : ${DIALOG_ITEM_HELP=4}
# : ${DIALOG_ESC=255}

#tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/test$$
#trap "rm -f $tmp_file" 0 1 2 5 15


dialog --title "Installation" --checklist "test" 0 0 0  1 Attack off 2 Defense off 3 Forensic off 4 Admin off 5 Anonym off

dialog --title " Menu! " --column-separator "|" --checklist "" 0 0 0 "1" "INFO|INSTALLE|CONTENEURISE|LANCE|BOOT" "2" "Option|Two" "3" "Option|Three" "4" "Option|Four"
