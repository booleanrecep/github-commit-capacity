#!/bin/bash
for i in {10}
do
   date >> README.md
   git add . 
   git commit -m 'commit'
done