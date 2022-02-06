package main

import (
	"fmt"
	"os/exec"
	"github.com/joho/godotenv"
)

func main() {
	godotenv.Load()	
	commitCount := os.Getenv("commitCount")
	pushThreshold := os.Getenv("pushThreshold")
	
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
