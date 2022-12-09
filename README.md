# My Learning of Bash Scripting
I documented my leaning of My Bash Scripting in journey of DevOps learning.

Lets Begin...

## what is Automation 
It a process by which we can complete any task with intervention or without human intervention.

## what is shell scripting 
Shell scripting is a group of commands written in a sequence to automate.
### To know all the available shell in your OS run given command in terminal.
```bash
cat /etc/shells
```

## How to automate tasks.
step1: Get all commands wants to run in correct order.<br>
step2: Write it in shell script file example "xyz.sh".<br> 
step3: Now execute "xyz.sh" script.<br>


## Hello, World script

1. Create a file named hello.sh
2. Write commands wants to execute inside hello.sh
3. Every bash shell script file start with #! [location of your bash]
```bash
#! /bin/bash

echo "Hello, world"
```
4. Then execute it by running command <br>
```bash
./hello.sh
```
5. If your terminal shows message "Permission denied", then you need to give file hello.sh to executable permission by running command <br>
```bash 
chmod +x hello.sh
```

## Comments & Variables

You can comment any perticular line by starting '#' symbol. Example <br>
```bash
#! /bin/bash

# This is a comment.
echo "Hello, World"
```

There are two type of variables in scripting, System variables & User defined variables.

### System Variables
```bash
#! /bin/bash

# This is a comment.
echo "Hello, World"

# following are some system variables.
echo $BASH   
echo $BASH_VERSION
echo $HOME
echo $PWD
```
### User-defined Variables

```bash
#! /bin/bash

# following are some system variables.
echo $BASH   
echo $BASH_VERSION
echo $HOME
echo $PWD

# following is user-defined variable
name=Gotam
# 10val -> This is not valid variable 
echo My name is $name
```

