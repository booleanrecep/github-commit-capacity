package main

import (
    "fmt"
    "os/exec"
)

func main() {
    git := "git"

    arg1 := "commit"
    arg2 := "--allow-empty"
    arg3 := "-m"
    message := "'go + git + github = 💥'"
    commitCount := 10//0000

    for i:=0; i<commitCount ;i++ {

        cmd := exec.Command(git, arg1 , arg2, arg3, message)
        stdout, err := cmd.Output()

        if err != nil {
            fmt.Println("🔥",err.Error())
            return
        }
        fmt.Println("🚀",string(stdout))
    }

    push := "push"
    cmd := exec.Command(git, push)
    stdout, err := cmd.Output()

    if err != nil {
        fmt.Println("🔥",err.Error())
        return
    }
    fmt.Println("🛬",string(stdout))   

}
