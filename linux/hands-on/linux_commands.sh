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