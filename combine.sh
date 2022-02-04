#!/bin/bash

git pull

for i in {1..800000}
do
   echo $i >> can/$i.txt
   git add . 
   git commit -m 'github ist bombastisch'

   if [[ $i%100 -eq 0 ]]
   then 
      git push
   else
      echo "keep commiting"   
   fi
  
done
