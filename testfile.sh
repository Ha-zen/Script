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
function tab(){

package=("nessus" "docker" "elvire" "jemais")
desc=("aaa" "bbb" "ccc" "ddd")
len=${#package[@]}

list=()
for (( i=0; i<$len; i++ ));
do
  list+=("${package[i]}" "${desc[i]}" off)
done

script=$( dialog --backtitle "INFRASEC configuration" \
                 --checklist "Select program to configure and activate:" 20 80 10 \
                 "${list[@]}" \
          3>&1 1>&2 2>&3 )
 echo "$script was selected"

}
tab
