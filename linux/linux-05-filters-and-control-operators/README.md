# Hands-on Linux-05 : Filters and Control Operators
​
Purpose of the this hands-on training is to teach the students how to use filters and control operators in Linux.
​
## Learning Outcomes
​
At the end of the this hands-on training, students will be able to;
​
- Use filter commands.
​
- Pipe commands.
​
- Use Control operators.
​
## Outline
​
- Part 1 - Using Filters
​
- Part 2 - Using Control Operators
​
## Part 1 - Using Filters
​
**cat**
​
- Create a folder and name it filters.
​export PS1="\[\033[44m\]\u@\h:\w$\[\033[00m\]" ==> renklendirme
```bash
mkdir filters
cd filters
```
- Create a `text` file named `days.txt`.
​
```bash
vim days.txt
```
​
```txt
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
Sunday
```
- Display the content of days.txt.
```bash
cat days.txt # yazilani goruntuledik / cat yanindaki file ekrana type ediyor
```
- Show what cat command does when used in a pipe.
​
```bash
cat days.txt | cat | cat | cat | cat # ilk cat ciktiyi bir saga atar
```
- Create a `text` file named `count.txt`.
​
```bash
nano count.txt 
```
```text
one
two
three
four
five
six
seven
eight
nine
ten
eleven 
```
- Display the content of count.txt.
```bash
cat count.txt  # tac ==> tersten yazdirir yani reverse
```
**tee**
​
- Write the content of the count.txt file in reverse order to another file named temp.txt and display the content of temp.txt in reverse order.
```bash
tac count.txt | tee temp.txt | tac # count tersten yazilir sonra tekrar reverse yani ilk haline gelir
tac count.txt | tee temp.txt ==> ilkini ters cevirip tempt.txt ye yazdirir
```
- Check whether the temp.txt file created and display the content.
​
```bash
ls
cat temp.txt
```
- Create a file named 'myfiles.txt' from the output of 'ls -l' command and display the .txt files.
​
```bash
ls -l | tee myfiles.txt | find *.txt # ls -l yi alir myfiles dosyasina yazdirir ve daha sonra txt dosyalarinin hepsini cikartir / ls -l > myfiles.txt ile ayni
```
- Check whether the myfiles.txt file created and display the content.
​
```bash
ls
cat myfiles.txt
```
**grep**
​
- Create a `text` file named `tennis.txt`.
​
```bash
cat > tennis.txt # asagidakileri yazdiracagiz
​
Amelie Mauresmo, Fra
Justine Henin, BEL
Serena Williams, USA
Venus Williams, USA
```
>**press ctrl+d for EOF**
​
- Display the content of tennis.txt.
```bash
cat tennis.txt
```
- Display only the lines of tennis.txt that includes 'Williams'.
​
```bash
cat tennis.txt | grep Williams # tennis.txt de Williams lari bulmaktayiz
```
- Display only the lines of tennis.txt that includes 'us'.
​
```bash
cat tennis.txt | grep us # sadece kucuk us leri verir / -i us yazarsak kucuk buyuk hepsini verir
```
- Display the owners column (3rd column) of all the files in current directory.
​
**cut**
​
```bash
ls -l | cut -d' ' -f3 # -d ==> delimeter ayirac gibi tarif edebiliriz / 
```
- Display the content of /etc/passwd directory.
​
```bash
cat /etc/passwd
```
- Display only the usernames.
​
```bash
cut -d: -f1 /etc/passwd # d yerine c koyarsak karakter olarak verir / cut -c 1-3 myfiles.txt ==> satirlarin ilk 3 karakterlerini alir
```
**tr** # translate 
​
- Create a `text` file named `clarusway.txt`.
​
```bash
cat << EOF > clarusway.txt
Clarusway:Road to reinvent yourself.
EOF # (end of file demektir)
```
- Display the content of clarusway.txt.
​
```bash
cat clarusway.txt
```
- In the content of clarusway.txt, replace or translate aer letters with 'QAZ'.
​
```bash
cat clarusway.txt | tr aer QAZ # gecici karakterleri degistiriyor a==> Q ile e ==> A ile r==>Z ile
```
​
- Write the content of count.txt on the same line.
​
```bash
cat count.txt | tr '\n' ' '
```
​
- Delete all the vowels in the content of clarusway.txt.
​
```bash
cat clarusway.txt | tr -d aeiou # -d delete anlamindadir ==> cat clarusway.txt | tr -d r ==> r leri sileriz / -s ise tekrarlan harfler uzerinden islem yaptirir
```
​
- Write the whole content of clarusway.txt in capital letters.
​
```bash
cat clarusway.txt | tr [a-z] [A-Z] # hepsini buyuk harfe donusturur
```
**wc**
​
- Count the lines, words and letters of the content of count.txt.
​
```bash
wc count.txt
```
- Find how many users are there in the computer.
```bash
wc -l /etc/passwd  # l lines anlaminda / kac tane line yani kullanici oldugunu sayar
```
**sort**
​
- Create a `text` file named `marks.txt`.
​
```bash
cat << EOF > marks.txt
aeron-9
albert-9
james-9
john-10
oliver-7
tom-7
victor-10
walter-8
EOF
```
- Display the content of marks.txt.
​
```bash
cat marks.txt
```
- Sort the content of marks.txt.
​
```bash
sort marks.txt # alfabetik siraya gore koyar
```
- Sort the content of marks.txt in reverse order.
​
```bash
sort -r marks.txt # -r yerine f ile yaparsak buyuk kucuk harf uyumuna dikkat eder
```
**uniq**
​
- Create a `text` file named `trainees.txt`.
​
```bash
cat << EOF > trainees.txt
john
james
aeron
oliver
walter
albert
james
john
travis
mike
aeron
thomas
daniel
john
aeron
oliver
mike
john
EOF
```
- Display the content of trainees.txt.
​
```bash
cat trainees.txt
```
- Display only the unique names in the content of trainees.txt.
​
******before using uniq command, the file must be sorted******
​
```bash
sort trainees.txt | uniq # unic olanlari cikartir
```
**comm**
​
- Create a `text` file named `file1.txt`.
​
```bash
cat << EOF > file1.txt 
Aeron
Bill
James
John
Oliver
Walter
EOF
```
- Create another `text` file named `file2.txt`.
​
```bash
cat << EOF > file2.txt
Guile
James
John
Raymond
EOF
```
- Compare file1.txt and file2.txt.
​
******before using comm command, files must be sorted****** # iki dosyada once sirali bir sekilde olmali yani dosyamizi gerekirse baksa bir dosya icerisinde siralamaliyiz
​
```bash
comm file1.txt file2.txt
```
- EXERCISE:
​
  - Create a file named `countries.csv`.
​
```bash
cat << EOF > countries.csv
Country,Capital,Continent
USA,Washington,North America
France,Paris,Europe
Canada,Ottawa,North America
Germany,Berlin,Europe
EOF
```
  - Cut only 'Continent' column | Remove header | Sort the output | List distinct values | Save it to 'continent.txt' and display on the screen.
​ == > ec2-user@ip-172-31-57-219:~/filters$cut -d ',' -f3 countries.csv | tail -4 | sort |uniq | tee continents.txt
```bash
********************************
```
## Part 2 - Using Control Operators
​
- Create a folder and name it operators.
​
```bash
mkdir operators
cd operators
```
**;**
​
- Write two seperate cat command on the same line using ;.
​
```bash
cat days.txt ; cat count.txt # iki ayri dosyayi ard arda yazdirir
```
```bash
echo Hello ; echo World! # iki komutu da ard arda yani sirali bir sekilde calistirir. yani iki komutu calistirabiliriz
```
**&**
​
- Run sleep 10 command and show that the kernel is busy until the process of this command ends.
​
```bash
sleep  10
```
- Run sleep 20 command and let this command work behind while you're running other commands.
​
```bash
sleep  20 &
ls -l
cat count.txt
cat days.txt
```
**$?** # ==> fail
​
- Run ls command and show that it is executed successfully.
​
```bash
ls
echo $?
```
- Run lss command and show that it failed.
​
```bash
lss
echo $?
```
**&&**
​
- Display days.txt and if it runs properly display count.txt.
​
```bash
cat days.txt && cat count.txt # ilk komut basarili ise digerini de calistirir
```
- Display days.text and if it runs properly display count.txt.
​
```bash
cat days.text && cat count.txt
```
**||**
​
- Display days.txt or write 'clarusway' on the screen, then write 'one'.
​
```bash
cat days.txt || echo clarusway ; echo one
```
- Write 'first' or write 'second' on the screen, then write 'third'.
​
```bash
echo first || echo second ; echo third
zecho first || echo second ; echo third
```
**&& and ||**
​
- Make a copy of file1.txt and named it file11.txt.
​
```bash
cp file1.txt file11.txt
```
- Delete file11.txt and write a message if it is deleted properly.
​
```bash
rm file11.txt && echo 'it worked' || echo 'it failed'
```
- Run the last command again.
​
```bash
rm file11.txt && echo 'it worked' || 'it failed'
```
**#**
​
- Run the echo command and add a comment line.
​
```bash
echo '# is the comment sign' # echo command displays the string comes after it.
echo # is the comment sign
echo \# is the comment sign
```
*** \ ***
​
- Run a single command on multipe lines.
​
```bash
echo this command is written \
not only on a single line \
but also on multiple lines.
```
- Write the following sentence on the screen: The special characters are *, \, ", #, $, '.
​
```bash
echo The special characters are \*, \\, \", \#, \$, \'.
```
- EXERCISE:
​
  1.a. Search for “clarusway.doc” in the current directory
    b. If it exists display its content
    c. If it does not exist print message “Too early!”
  2.Create a file named “clarusway.doc” that contains “Congratulations”
  3.Repeat Step 1
​answer # find -name clarusway.txt && cat clarusway.txt || echo “too early\!”
```bash
********************************
```