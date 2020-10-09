#!/bin/bash/


# let i=0 # define counting variable
# W=() # define working array
# while read -r line; do # process file by file
#     let i=$i+1
#     W+=($i "$line")
# done < <( more /tmp/liste )
# FILE=$(dialog --title "List file of directory /home" --radiolist "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
# clear
# if [ $? -eq 0 ]; then # Exit with OK
#     readlink -f $(more /tmp/liste | sed -n "echo "$FILE p" | sed 's/ //'")
# fi



# mapfile -t LIST < /tmp/liste

# while IFS= read -r line; do
#   LIST+=("$line")
# done < /tmp/liste
# echo "$LIST"
LIST=("nessus" "docker" "elvire" "jemais")   
                                                                                                                                                                                                                         
for item in LIST; do
  LIST+=( $( $item ) "aaa" off )
done
local script
script=$( dialog --backtitle "INFRASEC configuration" \
                 --checklist "Select program to configure and activate:" 20 80 10 \
                 "${LIST[@]}" \
          3>&1 1>&2 2>&3 )
# echo "$script was selected"