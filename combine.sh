#!/bin/bash

git pull

for i in {1..1000000}
do
#    echo $i >> can/$i.txt
   echo $i >> garbage.txt
   git add . 
   git commit --allow-empty -m 'github ist bombastisch'

#    if [[ $i%300 -eq 0 ]]
#    then 
#       git push
#    else
#       echo "keep commiting"   
#    fi
  
done
