#!/bin/bash
for i in {1..100000}
do
   echo $i >> README.md
   git add . 
   git commit -m 'commit'
   # git push
done