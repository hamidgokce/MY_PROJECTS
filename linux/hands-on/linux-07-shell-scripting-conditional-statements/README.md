# Hands-on Linux-07 : Shell Scripting/Conditional Statements

Purpose of the this hands-on training is to teach the students how to use conditional statements in shell.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain conditional statements in shell.

- use if statements in shell scripting

- use case statements in shell scripting

## Outline

- Part 1 - If Statements

- Part 2 - If Else Statements

- Part 3 - If Elif Else Statements

- Part 4 - Nested If Statements

- Part 5 - Boolean Operations

- Part 6- Case Statements

## Part 1 - If Statements

- Unix Shell supports conditional statements that are used to perform different actions on the basis of different conditions.

- A simple if statement essentially states, if a particular test is true, then perform a specified set of actions. If it's not true, don't take those acts.

- Create a folder and name it `conditional-statements`.

```bash
mkdir conditional-statements && cd conditional-statements
```

- Create a `script` file named `if-statement.sh`. 

```bash
#!/bin/bash
read -p "Input a number: " number

if [[ $number -gt 50 ]] # daima cift kullanacagiz. eger bashshell kullaniliyorsa hata almayiz. gt greater then
then
  echo "The number is big." # girinti onemli degil
fi # sayi eger kucuk olursa cikti vermez programi calistirmaz
```

- Make the script executable and execute it.

```bash
chmod +x if-statement.sh
./if-statement.sh
```

- We can use `Relational Operators`, `String Operators` or `File Test Operators` inside the square brackets ( [ ] ) in the if statement above. 

### Relational Operators # Rakamlar icin gecerli

- Bourne Shell supports the relational operators below that are specific to numeric values. These operators do not work for string values.

| Operator | Description |
| -------- | ----------- |
| -eq   | equal                  |
| -ne   | not equal              |
| -gt   | greater than           |
| -lt   | less than              |
| -ge   | greater than or equal  |
| -le   | less than or equal     |

### String Operators

- The string operators below are supported by Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| =    | equal            |
| !=   | not equal        |
| -z   | Empty string     |
| -n   | Not empty string |

- Let's see this. Create a file and name it `string-operators.sh`

```bash
#!/bin/bash

if [[ "a" = "a" ]]
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
```

- Notice that there are spaces between the opening bracket `[` and the parameters "text" = "text", and then between the parameters and the closing bracket `]`. That is precisely because the brackets here act as a command, and you are separating the command from its parameters.

- Make the script executable and execute it.

```bash
chmod +x string-operators.sh
./string-operators.sh
```

### File Test Operators

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

- Let's try this. Create files below and configure them.

```bash
mkdir folder
touch file 
chmod 400 file
```

Create a file and name it `file-operators.sh`

```bash
#!/bin/bash

if [[ -d folder ]]
then
  echo "folder is a directory"
fi

if [[ -f file ]]
then
  echo "file is an ordinary file"
fi

if [[ -r file ]]
then
  echo "file is a readable file"
fi

if [[ -w file ]]
then
  echo "file is a writable file"
fi

if [[ -s file ]]
then
  echo "file is > 0 bytes"
fi

if [[ -x $0 ]]
then
  echo "$0 is an executable file "
fi
```

- Make the script executable and execute it.

```bash
chmod +x file-operators.sh
./file-operators.sh
```

## Part 2 - If Else Statements

- Sometimes we want to execute a block of code if a statement is true, and another block of code if it is false.

- Create a `script` file named `ifelse-statement.sh`. 

```bash
#!/bin/bash
read -p "Input a number: " number

if [[ $number -ge 10 ]]
then
  echo "The number is bigger than or equal to 10."
else 
  echo "The number is smaller than 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x ifelse-statement.sh
./ifelse-statement.sh
```

> - Create a script. Ask user to enter `a file name` to create.
> - If there is a file with the same name, print the message "The file already exists."
> - If not, create the file and print the message "The file is created."

#!/bin/bash
read -p "enter a file name: " FILE
if [[ -e $FILE ]]
then
        echo "$FILE already exists"
else
        touch $FILE && echo "the file is created"
fi




#!/bin/bash
read -p “Enter file name: ” name
if [[ -e $name ]]
then
        echo “The file is existed”
else
       touch $name
fi


## Part 3 - If Elif Else Statements

- The elif statement is used when it requires to specify several conditions in our program.

# komutlar arasina noktali virgul koyulabilir ama bosluklara dikkat edilmesi lazim

- Create a `script` file named `elif-statement.sh`. 

```bash
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
```

- Make the script executable and execute it.

```bash
chmod +x elif-statement.sh
./elif-statement.sh
```

## Part 4 - Nested If Statements

- If statements can be nested. Let's see the nested structure on the followig example.

- Create a `script` file named `nested-if-statement.sh`. 

```bash
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
```

- Make the script executable and execute it.

```bash
chmod +x nested-if-statement.sh
./nested-if-statement.sh
```

## Part 5 - Boolean Operations

- The Boolean operators below are supported by the Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| !        | negation    |
| &&       | and         |
| ||       | or          |

- `!`  inverts a true condition into false and vice versa.

- `&&` is logical AND. If both the operands are true, then the condition becomes true otherwise false.

- `||`	is logical OR. If one of the operands is true, then the condition becomes true.	

- Create a `script` file named `boolean.sh`. 

```bash
#!/bin/bash

read -p "Input your name: " name
read -sp "Input your password: " password

if [[ $name = $(whoami) ]] && [[ $password = Aa1234 ]]
then
  echo -e "\nWelcome $(whoami)"
else
  echo -e "\nIt is wrong account"
fi
```

- Make the script executable and execute it.

```bash
chmod +x boolean.sh
./boolean.sh
```

## Part 6- Case Statements

- To execute a multiway branch, we can use several if-elif statements but that would soon become complicated. Bash case statements are similar to if-else statements but are easier and simpler. It helps to match one variable against several values.

- Create a `script` file named `case-statement.sh`. 

```bash
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
```

- Make the script executable and execute it.

```bash
chmod +x case-statement.sh
./case-statement.sh
```

man test 
man [
!! usteki komutu calistirir / echo ile dene
echo $? ==>  exit status
cat aaa ; echo $?

[ 100 -eq 100 ]
 echo $?

 [ “GNU” = “UNIX” ]
 echo $?# 1

stdin => standart in ve bunun da iki tane ciktisi var standartout ve standarterror 
stdin == 0 , stdout == 1 , stderr == 2
cat myfile > output.txt ==> data stream denir
2 ve & kavramlari var tekrar bak

/dev/null ==> topraklama gibi dusunebiliriz / cat myfile aaa 2> /dev/null

exit code echo $?



Ask user to enter his/her name.
Ask user to enter his/her age.
Ask user average life expectancy (ale).
Print user name with one of these messages regarding his/her age:
age<18 : 
	"Student"
	"At least X years to become a worker." 		# (X = 18 - age)
18<=age<65 : 
	"Worker"
	"X years to retire."					# (X = 65 - age)
age>=65 :
	if age less than ale:
		"Retired"
	"X years to die."				# (X = ale - age)
else:
		# beep sound                                # echo -ne '\007'
	"!!! Already died !!!"
		# wait 1 sec.
	"!!! Already died !!!"
		# wait 2 secs.
	"!!! Already died !!!"

  