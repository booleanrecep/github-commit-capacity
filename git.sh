#!/bin/bash

commitCount=50
pushThreshold=8

git pull

for i in $( eval echo {1..$commitCount} )
do
  git commit --allow-empty -m 'go + git + github = 💥'

 if [[ $i%$pushThreshold -eq 0 ]]
  then 
    git push 
    echo '🛬 pushed successfully'
  fi
done
