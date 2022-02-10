
### GitHub's Commit Capacity.

#### Motivation 
> Checking some relations and capabilities between GitHub & Git, client-server model, network, GitHub actions and Continous Integration.

#### Goal
> Making this repo most committed one on GitHub

#### How ?

1. Committing and pushing from GitHub to GitHub.
2. In the beginning I used my local and another platform to run git workflow scripts. But later on, I used GitHub actions to run them. So that there is no network latency because committed repo and committing actions (GitHub actions) resides in the same platform/virtual machine. That means pushing from GitHub to GitHub. 
3. Getting `COMMIT_COUNT` and `PUSH_THRESHOLD` from <i>.env</i>
4. Running `scripts` via <i>workflows</i> to achive 1. step

###### With Bash
<code>git.sh</code>
```shell
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
```

###### With Golang
<code>git.go</code>
```go
package main

import (
	"fmt"
	"os"
	"strconv"
	"os/exec"
	"github.com/joho/godotenv"
)

func main() {
	godotenv.Load()	
	commitCount, _ := strconv.Atoi(os.Getenv("COMMIT_COUNT"))
	pushThreshold, _ := strconv.Atoi(os.Getenv("PUSH_THRESHOLD"))
	
	git    := "git"
	commit := "commit"
	push   := "push"
	allow_empty := "--allow-empty"
	m := "-m"
	message := "'go + git + github = 💥'"

	for i := 0; i < commitCount; i++ {

		cmdCommit := exec.Command(git, commit, allow_empty, m, message)
		stdoutCommit, errCommit := cmdCommit.Output()

		if errCommit != nil {
			fmt.Println("🔥 commit error: ", errCommit.Error())
			return
		}

		fmt.Println("🚀 ",string(stdoutCommit))

		if (i % pushThreshold == 0) {

			cmdPush := exec.Command(git, push)
			_, errPush := cmdPush.Output()

			if errPush != nil {
				fmt.Println("🔥 push error: ", errPush.Error())
		
			}
            
			fmt.Println("🛬 pushed successfully")
		}

	}

}
```

###### With Node
<code>git.js</code>
```node
const { exec } = require("child_process");
require('dotenv').config();
const commitCount = process.env.COMMIT_COUNT;
const pushThreshold = process.env.PUSH_THRESHOLD;

const gitPull = () => {
  return exec("git pull", (err, stdout, stderr) => {
    if (err) {
      console.log("🔥 pull error: ", err);
      return;
    }
    console.log(`🚀 : ${stdout}`);
  });
};

const gitCommit = () => {
  return exec(
    'git commit --allow-empty -m "go + git + github = 💥"',
    (err, stdout, stderr) => {
      if (err) {
//         console.log("🔥 commit error: ", err);
        return;
      }
      console.log(`🚀 : ${stdout}`);
    }
  );
};

const gitPush = () => {
  return exec("git push", (err, stdout, stderr) => {
    if (err) {
      console.log("🔥 push error: ", err);
      return;
    }

    console.log(`🛬 pushed successfully: ${stdout}`);
  });
};

const run = () => {
  gitPull();

  for (let i = 0; i < commitCount; i++) {
    gitCommit();

    if (i % pushThreshold === 0) {
      gitPush();
    }
  }
};

run();
```

#### So far experiences
> Disclamer: These observations and thoughts may not be correct. These are my personal experiments and observations.
* In GitHub there are a few  repos that have over 1m+ commits. ( I didn't examine througoutly). 
   * [Linux](https://github.com/torvalds/linux) : 1.072.960~  ( respect to contributers)
   * [Commited](https://github.com/virejdasani/Commited) 3.000.000~
   * [This repo](https://github.com/booleanrecep/github-commit-capacity) : 12.176.258~
* `git push`ing from another platform or from our local will take slightly more time. Because there will be network latency. But using GitHub actions means our code/repo and Git are in same platform/machine ( a virtual machine provisioned by GitHub which our repo and action runners resides). So that there will be no network latency. That makes `git push`  blazingly faster.   
* Golang felt faster than Bash and Node, it's like a super-jet.
* Github actions have some restrictions and limits . Some GitHub error messages are like :
   *  No space left on device.
   *  You are running out of disk space.
   *  Each runner has only 6 hours (360 minute) exact time to do it's job.
* Temperature of my computer (2011 model Asus brand 4 core i7 processor) suddenly rised and the fan screamed. In System Monitor, the each of 4 core were over 80%.
* In GitHub actions with Go every three second (~3000ms)  ~1000 commits can be pushed. Disclamer: For that measurement I observed commit time in GitHub. So it's not scientific :)
* [Gitpod](https://gitpod.io/) blocked my account after running some scripts on their server. As they explained doing so degraded their platform and it looked like a DoS attack. Thanks to them again for unblocking my account. It's a nice and powerful platform.
* GitHub is such a powerful platform. Tens of thousands of file (.txt) I have created and written with commits alongside of push and nothing broken. 
* I have learned also that git has a flag that is `--allow-empty` and lets you write commit without any change. 
* ..... to be continued.
