#!/bin/bash
 
source .env
git pull

for i in $( eval echo {1..$COMMIT_COUNT} )
do
  git commit --allow-empty -m 'go + git + github = 💥'

 if [[ $i%$PUSH_THRESHOLD -eq 0 ]]
  then 
    git push 
    echo '🛬 pushed successfully'
  fi
done
