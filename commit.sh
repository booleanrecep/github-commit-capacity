#!/bin/bash
for i in {1..100}
do
   echo $i >> README.md
   git add . 
   git commit -m 'commit'
   sleep 1s
   git push
done