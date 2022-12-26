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