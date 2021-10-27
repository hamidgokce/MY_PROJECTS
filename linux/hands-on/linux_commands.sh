export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

Hands-on Linux-01 : Managing Files in Linux

# man       ==> man ls
# info      ==> info echo
# whatis    ==> whatis pwd
# apropos   ==> apropos pwd

# first 10 lines    ==> head file.txt
# first 5 lines     ==> head -5 file.txt
# last 10 lines     ==> tail file.txt
# last 5 lines      ==> tail -5 file.txt
# ==> cat > file.txt        we can write something then press ctrl + d
# more clarusway.txt
# less clarusway.txt        ==> less command is faster than more
# tac clarusway.txt         ==> in reverse
# find -name clarusway.txt if we want to search current location then type find . -name clarusway.txt
# find -iname clarusway.txt ==> small or capital letter
# find . -type d -name linux_lesson     ==> find directory
# find . -type f -name linux_lesson.txt ==> find file
# find . -type f -name "*.txt"          ==> find all txt files in location
# find . -type f -empty                 ==> find empty files
# find . -size +50M -size -100M         ==> 100MB > files > 50MB
# find . -mtime -10                     ==> find all files which are modified in the last 10 days in current directory
# find . -mmin +10 -mmin -30            ==> Find all the files which are modified more than 10 minutes back and less than 30 minutes in current folder


# GREP ==> Grep is a Linux / Unix command-line tool used to search for a string of characters in a specified file.
# grep "searching" file.txt     ==> search "searching" in file.txt
# grep is case sensitive command if you want to search regardless of capital/small letter you should type grep -i
# grep -i
# grep -w ==> to search whole words
# grep -v "shell" linux.txt     ==> subtracts the searched word line and returns the result. CASE SENSITIVE
# grep "^li" clarusway.txt      ==> Returns lines that begin with  "li"
# grep "kernel.$" linux.txt     ==> Returns lines that ending with  "kernel."

# grep -A3 "line 5"  clarusway.txt ==> display 3 line after a match
# grep -B3 "line 5"  clarusway.txt ==> display 3 line before a match
# grep -C3 "line 5"  clarusway.txt ==> display 3 line after & before a match

# man pwd | grep "print"
# man find | grep -A5 "size"
# history | grep "find"
# man find | grep "size

Hands-on Linux-02 : Linux Environment Variables

# env, printenv             ==> all environment variable
# echo $HOME, printenv HOME ==> specific environment variable
# CLARUS=way                ==> we assign shell variable
# set                       ==> we assign shell and environment variable
# set | grep CLARUS
# export WAY=clarus         ==> we assign env variable. But we can't see it in root or others

# useradd user1, passwd user1   ==> we create new user and assign password (We can also see the WAY variable in user1. because they are using the same home directory)


env         ==>     The env command is a shell command used to display and 
                    manipulate environment variables. It is used to list down environment 
                    variables.

printenv    ==>     The command prints all or the specified environment variables.
set         ==>     The command sets or unsets shell variables. When used without an 
                    argument it will print a list of all variables including environment and 
                    shell variables, and shell functions.

unset       ==>     The command deletes shell and environment variables.
export      ==>     The command sets environment variables.

Single - Double Quotes
==> It returns the string value with single quotes, but returns variable with double quotes.

sudo su             Switch to the superuser account.
sudo su -           Switch to the superuser account with roots environment.
sudo su - username  Switch to the usernames account with the usernames environment.
sudo -s             Start a shell as root
sudo -u root -s     Same as above.
sudo -u user -s     Start a shell as user

Hands-on Linux-03 : Managing Users and Groups

# whoami        display one-line manual page descriptions.
# who           provide with details about who is logged on the system.
# w             inform who is logged on and what they are doing.
# id            Display user id, your primary group id, and a list of the groups you belong to.
# su            enables a shell to be run as another user.
# su -          To become another user and also get the environment of the target user.

# cat /etc/passwd On Linux, the local user database is /etc/passwd.
# sudo useradd userx    ==> 
# sudo adduser userx    ==> more details

# useradd command is used for creating a new user. 
    -m is used for forcing the creation of the home directory
    -d is used for setting the name of the home directory
    -c is used for setting a description

# userdel   
Delete a user. userdel command will not remove the users home directory 
from the file system. If you want to remove the home directory, you need to 
use the -r in the command line.  (userdel -r user1)

# etc/group
Users can belong to several groups. Group membership is specified via the /etc/group file.

# groups
groups command is used to display a list of groups to which the user belongs.

# groupadd
groupadd command is used to create a new group. 

# usermod 
You can change group membership with the usermod command.

# groupmod 
groupmod command can be used to change the group name. (sudo groupmod -n my-linux linux )

# groupdel 
groupdel command is used to delete a group.

# gpasswd
With the gpasswd command, we can add a user to a group and to 
remove a user from a group. In the example below:
• We add john to aws group with gpasswd -a command. (sudo gpasswd -a user7 aws)
• We remove walter from aws group with gpasswd -d command. (sudo gpasswd -d user7 aws)


Hands-on Linux-04 : Using Package Managers in Linux

https://stackoverflow.com/questions/10286459/multiple-package-manager

sudo apt update / upgrade   ==> ubuntu
sudo yum update             ==> centos

sudo yum install git
sudo yum remove git
sudo yum autoremove git
sudo yum info git
sudo yum list
sudo yum list git
sudo yum list installed ==> List of packages installed in local
sudo yum --showduplicatess list git ==> list of packages that can be installed in the repo

sudo apt install git
sudo apt remove git
sudo apt autoremove git
sudo apt info git
sudo apt list
sudo apt list git
sudo apt list --installed


cat /etc/os-release # ==>cihazin adi versiyonu ve diger ozellikleri hakkidan ubuntu ve linux bilgi verir
rpm -ql git ==> git in yuklu oldugu yeri gosterir


Hands-on Linux-05 : Filters and Control Operators

cat / tac

tee
# tee is almost the same as cat, except that it has two identical outputs.

ls -l | tee myfiles.txt | find *.txt 
# ls -l yi alir myfiles dosyasina yazdirir ve daha sonra txt dosyalarinin hepsini cikartir 
yani ==> ls -l > myfiles.txt ile ayni

cut
# The cut filter can select columns from files, depending on a delimiter or a count of bytes
==> cut -d(delimiter) -f(columnNumber) <fileName> (ls -l | cut -d' ' -f3) d or c

tr
# The command 'tr' stands for 'translate’. It is used to translate, like from lowercase to uppercase and vice versa or new lines into spaces.
==> cat clarusway.txt | tr -d aeiou (-d = delete)
==> cat clarusway.txt | tr [a-z] [A-Z]

wc
# Counting words, lines(l) and characters(c) is easy with wc(w).

sort 
# The sort filter will default to an alphabetical sort.
    sort -r the flag returns the results in reverse order

    sort -f the flag does caseinsensitive sorting

uniq
# With the help of uniq command you can form a sorted list in which every word will occur only once
(before using uniq command, the file must be sorted)
sort trainees.txt | uniq

comm
# The 'comm' command compares two files or streams. By default, 'comm' will always display three columns. 
#First column indicates non-matching items of first file, second column indicates non-matching items of second file, and third column indicates matching items of both the files. 
# Both the files has to be in sorted order for 'comm' command to be executed.

Semicolon (;)
# You can put two or more commands on the same line separated by a semicolon (;)

Ampersand (&)
# When a line ends with an ampersand &, the shell will not wait for the command to finish. You 
# will get your shell prompt back, and the command is executed in background. You will get a 
# message when this command has finished executing in background. (sleep 10)

Dollar Question Mark ($?) ==> echo $?
# This control operator is used to check the status of last executed command. If 
# status shows '0' then command was successfully executed and if shows '1' then command was a failure.

Double Ampersand (&&)
# The command shell interprets the && as the logical AND. When using this 
# command, the second command will be executed only when the first one has been successfully executed.

Double Vertical Bar (||)
# The command shell interprets the (||) as the logical OR. This is opposite of 
# logical AND. Means second command will execute only when first command will be a failure

Combining && and ||
# You can use this logical AND and logical OR to write an if-then-else structure 
# on the command line. This example uses echo to display whether the rm command was successful.

Pound Sign (#)
# Everything written after a pound sign (#) is ignored by the shell. This is useful 
# to write a shell comment but has no influence on the command execution or shell expansion

Escaping Special Characters (\)
# Escaping characters are used to enable the use of control characters in the 
# shell expansion but without interpreting it by the shell.

# Lines ending in a backslash are continued on the next line. The shell does not 
# interpret the newline character and will wait on shell expansion and execution of 
# the command line until a newline without backslash is encountered.


echo this command is written \
not only on a single line \
but also on multiple lines.

echo The special characters are \*, \\, \", \#, \$, \'


Hands-on Linux-06 : Shell Scripting Basics

Shell Scripting Basics

# All the scripts would have the .sh extension.

#!/bin/bash
echo "Hello World"

==>     Before we add anything else to our script, we need to alert the system that a shell script is being started.
        This is done specifying `#!/bin/bash` on the first line, meaning that the script should always be run with bash, rather than another shell.
        `#!` is called a `shebang` because the `#` symbol is called a hash, and the `!` symbol is called a bang.

chmod +x script.sh ==> we need to make the script executable.  To execute basic.sh, it is required to add **./** beginning of the `basic.sh`

HEREDOC syntax

#!/bin/bash
echo "hello"
# date
pwd # This is an inline comment
# ls

cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF

<< multiline-comment
pwd
ls
Everything inside the
HereDoc body is
a multiline comment
multiline-comment

Shell Variables

The name of a variable can contain only letters (a to z or A to Z), numbers ( 0 to 9) or
the underscore character (_) and beginning with a letter or underscore character.

> Note that there is no space on either side of the equals ( = ) sign. 

Command Substitution

content=$(ls)
echo $content

- lets see that in a script. Create a file and name it `command-substitution.sh`.

#!/bin/bash
working_directory=$(pwd)
echo "Welcome, your working directory is $working_directory."

#!/bin/bash
echo "Welcome, your working directory is $(pwd)."
echo "Today is `date`"
echo "You are `whoami`"


Console input

- The Bash `read` command is a powerful built-in utility used take user input. 

- Update the `variable.sh` file.

```bash
#!/bin/bash
echo "Enter your name: "
read NAME
echo "Welcome $NAME"
```

- When writing interactive bash scripts, we can use the read command to get the user input. 
To specify a prompt string, use the -p option. The prompt is printed before the read 
is executed and doesn’t include a newline.

```bash
read -p "Enter your name: " NAME
echo "Welcome $NAME"
```

- When entering sensitive information we do not want to display input coming. 
For this we can use `read -s`

```bash
read -p "Enter your name: " NAME
echo "Welcome $NAME"

read -s -p "Enter your password: " PASSWORD
echo -e "\nYour password is $PASSWORD"

Command Line Arguments

- Command-line arguments are given after the name of the program in command-line shell of Operating Systems. The command-line arguments $1, $2, $3, ...$9 are positional parameters, with $0 pointing to the actual command, program, shell script, or function and $1, $2, $3, ...$9 as the arguments to the command.

- Create a new file and name it `argument.sh`.

```bash
#!/bin/bash
echo "File Name is $0"
echo "First Parameter is $1"
echo "Second Parameter is $2"
echo "Third Parameter is $3"
echo "All the Parameters are $@"
echo "Total Number of Parameters : $#"
echo "$RANDOM is a random number"
echo "The current line number is $LINENO"
```

./argument.sh Joe Matt Timothy James Guile

Arrays

- In our programs, we usually need to group several values to render as a single value.
In shell, arrays can hold multiple values at the same time.

Defining arrays

- Following is the simplest method of creating an array variable. 

```bash
DISTROS[0]="ubuntu"
DISTROS[1]="fedora"
DISTROS[2]="debian"
DISTROS[3]="centos"
DISTROS[4]="alpine"
```

- We can also use following method.

```bash
devops_tools=("docker" "kubernetes" "ansible" "terraform" "jenkins")
```

#### Working with arrays

- We can access a value in an array by using the following method.

```bash
echo ${DISTROS[0]}
echo ${DISTROS[1]}
```

- We can access all elements by putting `@` instead of number.

```bash
echo ${DISTROS[@]}
```

- With the following method, we can learn number of elements.

```bash
echo ${#DISTROS[@]}

Simple Arithmetic

- There are many ways to evaluate arithmetic expression in Bash scripting

expr

- `expr` command print  the value of expression to standard output. Lets see this.

```bash
expr 3 + 5
expr 6 - 2
expr 7 \* 3
expr 9 / 3
expr 7 % 2
```

- Using `expr` command, we must have spaces between the items of the expression and must not put quotes around the expression. If we do that, 
the expression will not be evaluated but printed instead. See the difference.


- Lets create a simple calculator. Create a file and name it calculator.sh.

- Make the script executable. 

chmod +x calculator.sh

#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

echo "SUM="`expr $first_number + $second_number`
echo "SUB="`expr $first_number - $second_number`
echo "MUL="`expr $first_number \* $second_number`
echo "DIV="`expr $first_number / $second_number`

let

- let is a builtin function of Bash that helps us to do simple arithmetic. 
It is similar to `expr` except instead of printing the answer it saves the result to
 a variable. Unlike expr we need to enclose the expression in quotes. 
let "sum = 3 + 5"
echo $sum


- Note that if we dont put quotes around the expression then it must be written with no spaces.

x=5
let x++
echo $x

y=3
let y--
echo $y

----------------------

#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

let "sum = $first_number + $second_number"
let "sub = $first_number - $second_number"
let "mul = $first_number * $second_number"
let "div = $first_number / $second_number"
echo "SUM=$sum"
echo "SUB=$sub"
echo "MUL=$mul"
echo "DIV=$div"

let first_number++
let second_number--
echo "The increment of first number is $first_number"
echo "The decrement of second number is $second_number"

----------------------

Difference between `num++` and `++num`, or `num--` and `--num`

- Create a file and name it number.sh.

number=10
let new_number=number++   # This firstly assigns the number then increases.
echo "Number = $number"
echo "New number = $new_number"

number=10
let new_number=--number   # This firstly decreases the number then assigns.
echo "Number = $number"
echo "New number = $new_number"

Double Parentheses

- We can also evaluate arithmetic expression with double parentheses. We have learned that we could take the output of a command and save it as the value of a variable. We can use this method to do basic arithmetic.

sum=$((3 + 5))
echo $sum

- As we can see below, it works just the same if we take spacing out.

sum=$((3+5))
echo $sum
 
bc command is calculator in linux

Hands-on Linux-07 : Shell Scripting/Conditional Statements

==> If Statements

#!/bin/bash
read -p "Input a number: " number

if [[ $number -gt 50 ]] # daima cift kullanacagiz. eger bashshell kullaniliyorsa hata almayiz. gt greater then
then
  echo "The number is big." # girinti onemli degil
fi # sayi eger kucuk olursa cikti vermez programi calistirmaz

- We can use `Relational Operators`, `String Operators` or `File Test Operators` inside
 the square brackets ( [ ] ) in the if statement above. 

## Relational Operators 

- Bourne Shell supports the relational operators below that are specific to numeric values. These operators do not work for string values.

| Operator | Description |
| -------- | ----------- |
| -eq   | equal                  |
| -ne   | not equal              |
| -gt   | greater than           |
| -lt   | less than              |
| -ge   | greater than or equal  |
| -le   | less than or equal     |

## String Operators

- The string operators below are supported by Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| =    | equal            |
| !=   | not equal        |
| -z   | Empty string     |
| -n   | Not empty string |

## File Test Operators

- There are a few operators that can be used to test various properties associated with a Linux file. # file lerin turlerine bakabiliyoruz

| Operator | Description |
| -------- | ----------- |
| -d file   | directory  |
| -e file   | exists     |
| -f file   | ordinary file     |
| -r file   | readable          |
| -s file   | size is > 0 bytes |
| -w file   | writable          |
| -x FILE   | executable        |
#!/bin/bash

if [[ "a" = "a" ]] # the brackets here act as a command, 
#and you are separating the command from its parameters.
then
  echo "They are same"
fi

if [[ "a" != "b" ]]
then
  echo "They are not same"
fi

if [[ -z "" ]]
then
  echo "It is empty"
fi

if [[ -n "text" ]]
then
  echo "It is not empty"
fi

==> If Else Statements

#!/bin/bash
read -p "Input a number: " number

if [[ $number -ge 10 ]]
then
  echo "The number is bigger than or equal to 10."
else 
  echo "The number is smaller than 10"
fi

==> If Elif Else Statements

#!/bin/bash
read -p "Input a number: " number

if [[ $number -eq 10 ]]
then
  echo "The number is equal to 10."
elif [[ $number -gt 10 ]]
then
  echo "The number is bigger than 10"
else 
  echo "The number is smaller than 10"
fi

==> Nested If Statements

#!/bin/bash

read -p "Input a number: " number

if [[ $number -gt 10 ]]
then
  echo "Number is bigger than 10"

  if (( $number % 2 == 1 ))
  then
    echo "And is an odd number."
  else
    echo "And is an even number"
  fi
else 
  echo "It is not bigger than 10"
fi

==> Boolean Operations

- The Boolean operators below are supported by the Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| !        | negation    |
| &&       | and         |
| ||       | or          |

- `!`  inverts a true condition into false and vice versa.

- `&&` is logical AND. If both the operands are true, then the condition becomes true otherwise false.

- `||`	is logical OR. If one of the operands is true, then the condition becomes true.	

#!/bin/bash

read -p "Input your name: " name
read -sp "Input your password: " password

if [[ $name = $(whoami) ]] && [[ $password = Aa1234 ]]
then
  echo -e "\nWelcome $(whoami)"
else
  echo -e "\nIt is wrong account"
fi

==> Case Statements

- To execute a multiway branch, we can use several if-elif statements 
but that would soon become complicated. Bash case statements are similar 
to if-else statements but are easier and simpler. It helps to match one 
variable against several values.

#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number
read -p "Select an math operation
1 - addition
2 - subtraction
3 - multiplication
4 - division
" operation

case $operation in
  "1") 
     echo "result= $(( $first_number + $second_number))"
  ;;
  "2")
     echo "result= $(( $first_number - $second_number))"
  ;;
  "3")
     echo "result= $(( $first_number * $second_number))" 
     ;;
  "4")
     echo "result= $(( $first_number / $second_number))"
  ;;
  *)
     echo "Wrong choice..." 
  ;;
esac

Hands-on Linux-08 : Shell Scripting/Loops

==> While loops

#!/bin/bash

number=1

while [[ $number -le 10  ]]
do
  echo $number
  ((number++))
done
echo "Now, number is $number"

==> Until loops

#!/bin/bash

number=1

until [[ $number -ge 10  ]]
do
  echo $number
  ((number++))
done
echo "Now, number is $number"

- Note that, this time we write `-ge` instead of `-le`. 
So In first sitiuation, condition is false. It will execute the code until the condition is true. 

==> For loops

#!/bin/bash

echo "Numbers:"

for number in 0 1 2 3 4 5 6 7 8 9
do
   echo $number
done

echo "Names:"

for name in Joe David Matt John Timothy
do
   echo $name
done

==> Using arrays with the for loop

#!/bin/bash

devops_tools=("docker" "kubernetes" "ansible" "terraform" "jenkins")

for tool in ${devops_tools[@]}
do
   echo $tool
done

==> Continue and Break Statements
 
 #!/bin/bash

number=1

until [[ $number -lt 1  ]]
do
  echo $number
  ((number++))
done
echo "Now, number is $number"
# ctrl + C

==> Break Statement

#!/bin/bash

number=1

until [[ $number -lt 1  ]]
do
  echo $number
  ((number++))
  if [[ $number -eq 100 ]]
  then
    break
  fi
done

==> Continue Statement

#!/bin/bash

number=1

until [[ $number -lt 1  ]]
do
  ((number++))
  
  tens=$(($number % 10))
  
  if [[ $tens -eq 0 ]]
  then
    continue
  fi

  echo $number
    
  if [[ $number -gt 100 ]]
  then
    break
  fi
done

==>  Select loops

#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number

PS3="Select the operation: "

select operation in addition subtraction multiplication division exit
do
  case $operation in
    addition) 
      echo "result= $(( $first_number + $second_number))"
    ;;
    subtraction)
       echo "result= $(( $first_number - $second_number))"
    ;;
    multiplication)
       echo "result= $(( $first_number * $second_number))" 
       ;;
    division)
       echo "result= $(( $first_number / $second_number))"
    ;;
    exit)
       break
    ;;   
    *)
       echo "Wrong choice..." 
    ;;
  esac
done