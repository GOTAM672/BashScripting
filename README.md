# My Learning of Bash Scripting
I documented my leaning of My Bash Scripting in journey of DevOps learning.

Lets Begin...

## Table of Contents 
<br>

- [what is Automation](#what-is-Automation)
- [what is shell scripting](#what-is-shell-scripting)
- [Available shell in your OS](#available-shell-in-your-OS)
- [How to automate tasks](#How-to-automate-tasks)
- [Hello World script](#Hello-World-script)
- [Comments & Variables](#Comments-&-Variables)
- [Read User Input](#Read-User-Input)
- [How to pass arguments to the Bash Script](#How-to-pass-arguments-to-the-Bash-Script)
- [If Statement](#If-Statement)
- [IF-ELSE statement](#IF-ELSE-statement)
- [File Testing](#File-Testing)
- [Logical Operator](#Logical-Operator)
- [Arithmetic Operation](#Arithmetic-Operation)
- [Case Statement](#Case-Statement)
- [Array Variables](#Array-Variables)
- [Loops](#Loops)
- [Break and Continue](#Break-and-Continue)Functions
- [Functions](#Functions)



## What is Automation 
It a process by which we can complete any task with intervention or without human intervention.

## What is shell scripting 
Shell scripting is a group of commands written in a sequence to automate.

## Available shell in your OS
Run command

```bash
cat /etc/shells
```

## How to automate tasks
step1: Get all commands wants to run in correct order.<br>
step2: Write it in shell script file example "xyz.sh".<br> 
step3: Now execute "xyz.sh" script.<br>


## Hello World script

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
echo "username : $user_name"

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

## IF-ELSE statement

```bash
#! /bin/bash

count=10
if [ $count -eq 10 ]
then
  echo "count is equal to 10."
elif [ $count -eq 9 ]
then
  echo "count is equal to 9"
else
  echo "condition is false."
fi

```

## File Testing

There are basically two types of files :
1. Block Special File<br>
It is a binary file which is generally pictures , videos, music etc.
2. Character Special File<br>
It is normal file which can contains some text, data or character etc.

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"  # -e is use to enable the interpretation of \c which keep the cursor on the same line.
read file_name

if [ -e $file_name ]  # -e is use to check weither file is exist or not
then
  echo "$file_name found"
else
  echo "$file_name not found"
fi

# -e is use to check weither file is exist or not
# -f is use to check weither file is exist or not and regular file
# -d is use to check weither directory is exist or not
# -b is use to check weither file is block special file
# -c is use to check weither file is character special file

# -s is use to check weither file is empty or not
# -r -w -x are use to check weither file has read, write , execute permission respectively.
```
Example : How to append output to end of text file.

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name ]
then
  if [ -w $file_name ]
  then
    echo "Type some text. To quit press ctrl+d."
    cat >> $file_name
  else
    echo "The file do not have write permission."
  fi
else
  echo "$file_name not found"
fi
```

## Logical Operator

### AND

```bash
#! /bin/bash

age=25

if [ $age -gt 18 ] && [ $age -lt 30 ] # Also written as [ $age -gt 18 -a $age -lt 30 ] or [[ $age -gt 18 && $age -lt 30 ]]
then
  echo "Valid Age."
else
  echo "Age is not valid."
fi

```

### OR

```bash
#! /bin/bash

age=60

if [ $age -gt 18 ] || [ $age -lt 30 ] # Also written as [ $age -gt 18 -o $age -lt 30 ] or [[ $age -gt 18 || $age -lt 30 ]]
then
  echo "Valid Age."
else
  echo "Age is not valid."
fi

```

## Arithmetic Operation


### On integer
```bash
#! /bin/bash

num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

# Another Method

echo $(expr $num1 + $num2 )
echo $(expr $num1 - $num2 )
echo $(expr $num1 \* $num2 )
echo $(expr $num1 / $num2 )
echo $(expr $num1 % $num2 )

```

### On floating point

bc - An arbitrary precision calculator language

```bash
#! /bin/bash

num1=20.5
num2=5

echo "$num1 + $num2" | bc
echo "$num1 - $num2" | bc
echo "$num1 * $num2" | bc
echo "$num1 / $num2" | bc           # gives wrong answer
echo "scale=2;$num1 / $num2" | bc   # gives correct answer
echo "$num1 % $num2" | bc


num=99
echo "scale=2;sqrt($num)" | bc -l   # calling math library with bc.
echo "scale=2;4^2" | bc -l   # 2 to the power 4

```

## Case Statement

Example 1

```bash
#! /bin/bash

vehicle=$1   #argument receive from command line will store in vehicle

case $vehicle in
    "car" )
        echo "Rent of $vehicle is 100 dollar" ;;
    "van" )
        echo "Rent of $vehicle is 80 dollar" ;;
    "bicycle" )
        echo "Rent of $vehicle is 5 dollar" ;;
    "truck" )
        echo "Rent of $vehicle is 150 dollar" ;;
    * )
        echo "Unknown Vehicle" ;;
esac
```
Example 2

```bash
#! /bin/bash

echo -e "Enter some character : \c"
read input

case $input in
    [a-z] )
        echo "user entered $input from a to z" ;;
    [A-Z] )
        echo "user entered $input from A to Z" ;;
    [0-9] )
        echo "user entered $input from 0 to 9" ;;
    ? )
        echo "user entered $input - a special character" ;;
    * )
        echo "Unknown input" ;;
esac
```

## Array Variables

```bash
#! /bin/bash

OS=('ubuntu' 'Arch' 'window')
echo "${OS[@]}"    # print all the elements of array OS
echo "${!OS[@]}"   # prints the indexes of the array
echo "${#OS[@]}"   # prints the of the array

echo "${OS[0]} ${OS[1]} ${OS[2]}"

OS[3]='mac'        # add 4th element to the array
OS[7]='kali'       # It's possible
unset OS[2]        # remove element at index 2

```
## Loops

In until loop, commands are executed when conditions are TRUE.

### While Loop

Example: Print 1 to 10
```bash
#! /bin/bash

n=1

while [ $n -le 10 ]
do
   echo "$n"
   n=$(( n+1 ))   # or (( n++ )) 
   sleep 1        # It will print the number with one second delay.
done

```

Example: open 3 terminal using Bash Script

```bash
#! /bin/bash

n=1

while [ $n -le 3 ]
do
   echo "$n"
   n=$(( n+1 ))   # or (( n++ )) 
   gnome-terminal &
   sleep 2        # It will print the number with two second delay.
done

```
Example: Read file content

```bash
#! /bin/bash

while read f
do
   echo $f
done < hello.sh 

# Another Method

cat hello.sh | while read f
do
   echo $f
done

# Another Method

while IFS= read -r file
do
   echo $file
done < hello.sh

```

### Until Loop

In until loop, commands are executed when conditions are FALSE.

```bash
#! /bin/bash

n=1

until [ $n -ge 10 ]
do
   echo "$n"
   n=$(( n+1 ))   # or (( n++ )) 
   sleep 1        # It will print the number with one second delay.
done

```

### For Loop

Different Syntax of For Loop.

```bash
#! /bin/bash

# Syntax 1---------------------------------------------------------------

for VARIABLE in 1 2 3 4 5 .. N
do
    command1
    command2
    command3
done

# Syntax 2---------------------------------------------------------------

for VARIABLE in file1 file2 file3
do
    command1
    command2
    command3
done

# Syntax 3---------------------------------------------------------------

for OUTPUT in $(Linux or Unix Command Here...)
do
    command1
    command2
    command3
done

# Syntax 4---------------------------------------------------------------

for (( EXP1; EXP2; EXP3 ))
do
    command1
    command2
    command3
done

```

Simple Examples 

```bash
#! /bin/bash

for i in 1 2 3 4 5
do
    echo $i
done

```

```bash
#! /bin/bash

for i in {1..10 }     # Iterate number 1 to 10
do
    echo $i
done

```

```bash
#! /bin/bash

for (( i=0; i<5; i++ ))
do
    echo $i
done

```

```bash
#! /bin/bash

for i in {1..10..1 }  # Iterate number 1 to 10 and increase the variable by 2 : {START..END..INCREMENT}
do
    echo $i
done

```
Usefull Example

```bash
#! /bin/bash

for command in ls pwd date
do
    echo "----------$command--------------"
    $command
done

```

```bash
#! /bin/bash

for item in *
do
    if [ -d $item ] # To chech weither item is directory or not
    then
      echo $item
    fi
done

```

### Select Loop

It is similar to For Loop, it gives menu list to user to select.

```bash

#! /bin/bash

select name in gautam suman himanshu anshu
do
    echo "$name selected"
done

```

## Break and Continue

Break Keyword

```bash
#! /bin/bash

for (( i=0; i<10; i++ ))
do
    if [ $i -gt 5 ]
    then
      break
    fi
    echo $i
done

```

Continue Keyword

```bash
#! /bin/bash

for (( i=0; i<10; i++ ))
do
    if [ $i -eq 5 -0 $i -eq 9 ]
    then
      continue
    fi
    echo $i
done

```

## Functions

Syntax of function.

```bash
#! /bin/bash

# Syntax1------------------------------------------------------------

function Add(){
    Commands
}

# Syntax2------------------------------------------------------------

Add(){
    Commands
}

```

Examples.

```bash
#! /bin/bash

function Hello(){
    echo "Hello, World"
}

quit(){
    exit
}

# function call 

Hello
quit

```

Argument Passing

```bash
#! /bin/bash

function Print(){
    echo $1 $2
}

quit(){
    exit
}

# function call 

Print Gotam Gorabh  # Here calling Print function with passing arguments
quit

```

### Local Variable

```bash
#! /bin/bash

function Print(){
    local Name=$1      # local Name variable
    echo "My name is $Name"
}

Name="India"           # global Name variable 

echo "The name is $Name"
Print Gotam
echo "The name is $Name"

```
