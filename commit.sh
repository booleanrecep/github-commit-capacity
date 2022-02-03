#!/bin/bash
for i in {1..100000}
do
   echo $i >> source.txt
   git add . 
   git commit -m 'commit'
   # git push
done