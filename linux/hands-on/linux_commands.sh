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



