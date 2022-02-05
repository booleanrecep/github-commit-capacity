
#### GitHub's Commit Capacity.


#### Motivation 
> Checking some relations and capabilities between client-server model, GitHub & Git.

#### Goal
> Making this repo most committed one

#### How ?
1. Committing and pushing from GitHub to GitHub. 
2. Running `combine.sh` via <i>workflows</i> to achive 1. step

<code>combine.sh</code>
```shell
#!/bin/bash

git pull

for i in {1..800000}
do
   #echo $i >> can/$i.txt
   # rm can/$i.txt
   echo $i >> garbage.txt
   git add . 
   git commit -m 'github ist bombastisch'  
done
git push
```

#### So far experiences
... 
