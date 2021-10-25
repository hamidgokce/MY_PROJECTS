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
sudo su -           Switch to the superuser account with root's environment.
sudo su - username  Switch to the username's account with the username's environment.
sudo -s             Start a shell as root
sudo -u root -s     Same as above.
sudo -u user -s     Start a shell as user