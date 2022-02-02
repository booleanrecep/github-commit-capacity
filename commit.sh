#!/bin/bash
for i in {1..2}
do
   echo $i >> README.md
   git add . 
   git commit -m 'commit'
   sleep 2s
   git push
done