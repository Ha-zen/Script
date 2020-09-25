#!/bin/bash/
# IFS=
T=$(ps -el | awk '{print $14}' | awk 'NR>2')
# echo "${T}"
liste=()
for value in ${T}
    do echo "${value}"
    # liste=(${value})  
done
# echo "${liste}"