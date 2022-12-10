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
# 10val -> This is not a valid variable 
echo My name is $name
```

## Read User Input

```bash
#! /bin/bash

echo "Enter your name.... : "
read Name   # Take input from user and store it in the variable Name
# read x y z -> Multiple input from user
echo "You entered the name : $Name"

# To read the user input on same line
read -p 'username : ' user_name
echo "username : $user_var"

# To hide the user input (example password)
read -sp 'password : ' user_pass
echo "Your password is : $user_pass"

# To Take multiple input from user and store it in an array
echo "Enter names..."
read -a names
echo "Names : ${names[0]}, ${names[1]}"

# Read input without storing variable 
echo "Enter your age..."
read            # the input goes in built-in variable called "REPLY"
echo "Age : $REPLY"

```

## How to pass arguments to the Bash Script 


```bash
#! /bin/bash

echo $0 $1 $2 ' > echo $1 $2'
# for example you run the script by running the command "./hello.sh mark Tom"
# then ./hello.sh will store in variable 0 , mark will store in variable 1, Tom will store in variable 2

# We can also pass arguments into the array
args=("$@")
echo ${args[0]} ${args[1]} # Here in array mark will store at index 0 and Tom will store at index 1
echo $@  # This line will print all the arguments that is store in args variables 
echo $# # This line will print the number of arguments that is passed.
```

## If Statement

```bash
#! /bin/bash

count=10
if [ $count -eq 10 ]
then
  echo "condition is true."
fi

# Integer Comparison
# -eq -> is equal to
# -ne -> is not equal
# -gt -> is greater than
# -ge -> is greater than or equal to
# -lt -> is leass than
# -le -> is less than or equal to
# < -> is less than (use it inside(()) ex- (( $count < 10)) )
# > -> is greater than (use it inside(()) ex- (( $count > 10)) )
# <= -> is less than or equal to (use it inside(()) ex- (( $count <= 10)) )
# >= -> is greater than or equal to (use it inside(()) ex- (( $count >= 10)) )

# String Comparision 
# = -> is equal to 
# == -> is equal to
# != -> is not equal to
# < -> is less than (use it inside[[]] ex- [[ $string < "abc"]] )
# > -> is greater than (use it inside[[]] ex- [[ $string > "abc"]] )
# -z -> string is null (use it inside[[]] ex- [[ $string -z "abc"]] )

```


