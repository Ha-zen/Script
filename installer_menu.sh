#!/bin/bash/

# : ${DIALOG_OK=0}
# : ${DIALOG_CANCEL=1}
# : ${DIALOG_HELP=2}
# : ${DIALOG_EXTRA=3}
# : ${DIALOG_ITEM_HELP=4}
# : ${DIALOG_ESC=255}

#tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/test$$
#trap "rm -f $tmp_file" 0 1 2 5 15


dialog --title "Installation" --checklist "test" 0 0 0 \
    1 Attack off \
    2 Defense on \
    3 Forensic off \
    4 Admin off \
    5 Anonym
