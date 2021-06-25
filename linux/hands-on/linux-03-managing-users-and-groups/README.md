# Hands-on Linux-03 : Managing Users and Groups

Purpose of the this hands-on training is to teach the students how to manage users and groups.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain users and groups in linux.

- manage users and groups.

## Outline

- Part 1 - Basic User Commands

- Part 2 - User Management

- Part 3 - User Passwords

- Part 4 - Group Management

## Part 1 - Basic User Commands
​
- whoami.
​
```bash
whoami # kullanicinin kim oldugunu gosterir
sudo su # kullanici root a gecer
pwd
whoami # kullanici root oldu
su ec2-user # kullanici roottan ec2 user a gecmistir
sudo su - # kullanici root a gececek ve environment variableler de degisecek. root un home directory sine gectik
pwd
```
​
- who. # linux pc de kac kullanici oldugunu gosterir
​
```bash
exit
who 
who # open a new shell and retry who command to see the users who logged in.
```
​
- w. # who komutunun daha detayli gosterimidir 
​
```bash
w
who
```
​
- id. 
​
```bash
id
id root # root un id sini verir
sudo su
useradd user1
id user1 # yeni olusturdugumuz user1 kullanicisinin bilgilerini verir
```
​
- su.
​
```bash
su ec2-user
su user1
sudo su user1
pwd
exit
sudo su - user1
pwd
```
​
- passwd.
​
```bash
exit
sudo su
useradd user2
passwd user2    # give a password to user2
su - user2 # - oldugu takdirde environment da degismektedir.
passwd
exit
su user2
```
​
## Part 2 - User management
​
- /etc/passwd.
​
```bash
exit
cat /etc/passwd # ec2 ortamindaki tum kullanicilari gostermektedir.
tail -3 /etc/passwd # son 3 satiri verecektir
```
​
- useradd.
​
```bash
sudo useradd user3 # 3. kullanici olusturuyoruz
cd /home 
ls
cd /etc
ls login*
cat login.defs # login.defs ==> 
sudo nano login.defs    # change the CREATE_HOME variable's value to "no" ==> yeni kullanici olusturuldugunda home directory si olusturulmamis olur
sudo useradd user4
cd /home && ls
cat /etc/passwd # olusturulan kullanicilar gozukecektir
sudo useradd -m user5    # force to system to create a home directory for user with -m option. ==> 
cd /home && ls
sudo useradd -m -d /home/user6home user6    # change the user's home directory name with -d option. ==> yukaridaki login.defs deki degisiklik sonrasi olusturulan kullanicilarin home directory si olusmamaktadir. fakat ustteki komutu girdigimizde yeni olusturulan kullanicinin home directory si olusacaktir.
ls
sudo useradd -m -c "this guy is developer" user7    # give a descrpition to user with -c option. ==> yeni olusturulan kullaciya description tanimlanmaktadir
cat /etc/passwd
cat /etc/passwd | grep user7
```
​
- userdel.
​
```bash
cat /etc/passwd
sudo userdel user5 # olusturulmus olan kullaniciyi silecektir ama home directory si kalir
cat /etc/passwd
cd /home && ls
sudo userdel -r user1    # delete user and its home directory with -r option. ==> kullanicinin home directory si de silinecektir
cd /home && ls
```
​
- usermod.
​
```bash
cat /etc/passwd
sudo usermod -c "this guy will be an aws solution architect" user7
cat /etc/passwd
sudo usermod --help
sudo usermod -l Superuser user2    # change the name of the user2 with -l option.
cat /etc/passwd
```
​
## Part 3 - User Passwords
​
- passwd-etc/shadow-etc/login.defs.
​
```bash
  sudo su
  useradd user8
  passwd user8
  cd /etc
  cat shadow
  cat login.defs
```
​
## Part 4 - Group Management
​
- groups.
​
```bash
groups # mevcut kullanicilarin hangi grupta oldugunu gosterir
sudo groupadd linux
sudo groupadd aws
sudo groupadd python
cat /etc/group # gruplar hakkinda bilgi verir
groups
sudo usermod -a -G linux ec2-user    # append ec2-user in linux group. kullanicilari gruplara ekleme cikarma icin kullanilir
cat /etc/group
groups
sudo usermod -G aws ec2-user    # this command deletes all groups that ec2-user in except default group of ec2-user and add ec2-user to aws group.
cat /etc/group
sudo groupmod -n my-linux linux    # change the name of the linux group.
cat /etc/group
groups
cat /etc/group
sudo groupdel python
cat /etc/group
sudo gpasswd -a user7 aws    # add a user to a group.
cat /etc/group
sudo gpasswd -d user7 aws    # delete a user to a group.
cat /etc/group
```