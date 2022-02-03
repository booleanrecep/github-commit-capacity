#!/bin/bash
for i in {1..900000}
do
   echo $i >> README.md
   git add . 
   git commit -m 'commit'
   # git push
done