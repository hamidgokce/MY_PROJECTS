21/06/2021 DONE
# Hands-on Linux-02 : Linux Environment Variables

Purpose of the this hands-on training is to teach the students how to use environment variables.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain environment variables.
==> It is a dynamic-named value that can affect the way running processes will behave on a computer.
- understand Quoting with Variables.

## Outline

- Part 1 - Common Environment Variables & Accessing Variable

- Part 2 - Path Variable

- Part 3 - Quoting with Variables

- Part 4 - Sudo Command

## Part 1 - Common Environment/Shell Variables & Accessing Variable
​
- Difference between "env" and "printenv" commands.
​==> # ikisi de defaulttaki environment variableleri verir. printenv ile tek cagirilabilir
```bash
env ==> # tum environmentler gosterilir
printenv ==> # spesific environment gosterilir
printenv HOME ==> # HOME un environment i gorunur
echo $HOME
env HOME ==> # default verdigi icin calismaz
```
​
- Understanding the shell variable.
​
```bash
CLARUS=way ==> # shell variable tanimliyoruz
env ==> # default olmadi icin CLARUS gorunmez ==> daha kisa hali env | grep CLARUS tek tek bakmayi engeller
set ==> # bir cok environment ve shell variable verir
set | grep CLARUS ==> # set icerisindeki CLARUS degerini getirir cunku tum variableleri verir
echo $CLARUS ==> # atamis oldugumuz degeri verir 
```
​
- Understanding the environment variable. Use export command.
​
```bash
export WAY=clarus ==> # komutu ile degiskeni default olarak atar(env icerisine)==> bu komut env ye yazdiracak sekilde guclu bir komuttur
# yukaridaki komutlar defaulttaki environment variable lere ekliyor
env
```
​
- Difference between shell and environment variables. Create a user, name it "user1", switch to user1, check the environment and shell variables.
​
```bash
export WAY=clarus ==> # env | grep WAY ile olusturulan environment variable yi goruruz
sudo su ==> # roota gecme komutu / ayrica environment variableler de degisir cunku rooton environment variableleri farklidir. burada env | grep CLARUS komutu gorunmez cunku tanimlanan CLARUS degiskeni sadece ec2 icin gecerliydi. [root@ip-172-32-62-58 ec2_user]# ==> ec2 yazmasinin sebebi home directory rootun degil ec2 nun home directorysi
useradd user1 ==> # yeni bir kullanici olusturuldu 
passwd user1 # give user1 any password.
exit ==> # tekrar roota gecildi.
su user1 ==> # user1 e gecildi ==> sifre ister. bir kullanicidan digerine gecerken password sorar fakat bu gecis roottan olursa password sormaz
# home directory hala ec2 nun home directorysi bu yuzden enironment variableler degismez.
# fakat su -user1 yazarsak environment variableler da degismektedir.
env | grep WAY ==> # ec2 home unda WAY=clarus yazisini gorecegiz
set | grep CLARUS ==> # ayrica shell veya environment vaiable yi silerken unset komutunu kullaniyoruz (unset WAY)
# CLARUS=way degerini gorececgiz
```
==> # set in altinda hem shell hemde environment variableler var fakat env nin altinda sadece environment variableler var
​cat /etc/passwd ==> userlar hakkinda bilgi verir
- Change the environment variable value.
​
```bash
==> # shell variable sadece calistigimiz terminalde geciyor diger terminalde gorunmez
export WAY=linux # variableyi degistirmiz olduk
env ==> # env | grep WAY komutu ile degistigini daha kisa bir sekilde gorebiliriz
export WAY=script ==> # yukarida ki degerin degisebiliecegini gormus oluyoruz
env
```
​
- Remove the environment variable with unset command.
​
```bash
export WAY=clarusway
env | grep WAY
unset WAY ==> # hem shell hem de environment variableler degisir
env | grep WAY ==> # silinen WAY degerini artik goremeyiz 
```
​
## Part 2 - Path Variable
​
- PATH variable.
​ ==> Linux de komutlarin calismasi icin gerekli olan dosyalarin bulundugu yerdir. Herhangi bir komut girildiginde executable file larini bulup calistirmaktadir linux un

```bash
printenv PATH 
cd /bin
ls ca*    # see the cat command.
```
​
- Add a path to PATH variable for running a script.
​
```bash
cd
mkdir test && cd test
nano test.sh
# copy and paste the code-echo "hello world"- in test.sh
chmod +x test.sh ==> executable file yetkisi verdik -x ile yetkileri tekrar  geri alabiliriz
./test.sh
cd    # change directory to ec2-user's home directory
./test.sh    # it doesnt work. 
./test/test.sh ==> # script tekrar pathi dogru verdimiz icin calisacaktir
printenv PATH ==> 
cd test
pwd
export PATH=$PATH:/home/ec2-user/test
printenv PATH
cd
test.sh ==> # basa nokta koymadan calistiracagiz
cd /
test.sh
```
​
- Using the environment variable in the script.
​
```bash
cd test
export CLARUS=env.var ==> # environment variable tanimlamis olduk
WAY=shell.var ==> # shell variable tanimladik
cd test
nano test1.sh
# copy and paste the code-echo "normally we should see env. variable $CLARUS but probably we can't see the shell variable $WAY "
chmod +x test1.sh
./test1.sh ==> # yukaridaki yorum satirindaki $CLARUS yerine tanimladigimiz env.var i gorecegiz ama $WAY e tanimladigimiz degeri goremeyecegiz/ YANI baska komutun icerisinde environment gorunurken shell variable gorunmez
```
​
## Part 3 - Quoting with Variables.
​
- Double Quotes.
​
```bash
MYVAR=my value # shell variable tanimlamis olduk
echo $MYVAR # yukarida tanimladigimiz shell variableyi ekranda gostermis olduk
MYVAR="my value"
echo $MYVAR
MYNAME=james
MYVAR="my name is $MYNAME"
echo $MYVAR
MYNAME="james"
MYVAR="hello $MYNAME"
echo $MYVAR # cift tirnak olarak tanimladigimiz icin MYNAME yerine james gelecek
MYVAR="hello \$MYNAME"
echo $MYVAR
```
​
- Single Quotes.
​
```bash
echo '$SHELL' # f string teki suslu parantez gibi ayni degerleri koruyacak. Fakat cift tirnak olarak yazdiracak olursak bize env deki pathini verecektir
echo 'My\$SHELL' # yukaridaki gibi ayni degeri yazdiracaktir
```
​
## Part 4 - Sudo Command.
​
- Sudo Command. # gecici sureli admin yetkilerini bulundurur. Yani yukseltilmis yetkiler olarak anlayabiliriz
​
```bash
yum update
sudo yum update
cd /
mkdir testfile
sudo su # ec2 nun home direktory deyiz
sudo -s
sudo su - # root un home direktory sine ulasiriz. Root un home direktory si home altinda degil root un altindadir
```