# Hands-on Linux-04 : Using Package Managers in Linux
​
Purpose of the this hands-on training is to teach the students how to use package managers in Linux.
​
## Learning Outcomes
​
At the end of the this hands-on training, students will be able to;
​
- Explain what is package management.
​
- Work with most common package management tools.
​
- Install, upgrade, configure and remove software packages using package management tools.
​
## Outline
​
- Part 1 - Using package managers ('yum' and 'apt') 
​
## Part 1 - Using Package Managers ('yum' and 'apt')
​
- Update Amazon Linux Instance.
​
```bash
sudo yum update # CentOS makinalarin guncellestirme komutu. repository deki guncellestirmeleri kontrol ediyor ve update ediyor
```
- Update Ubuntu's package list. This command updates the local repo database but do not install any package.
​
```bash
sudo apt update # repository deki metadatalari aliyor ama update etmiyor.
```
- Upgrade the packages. This command installs the listed available packages.

```bash
sudo apt upgrade # update edilebilecek versiyonlarin hepsini guncellemektedir
```

- Check if 'git' is installed on Amazon Linux instance.
​
```bash
git --version # eger git yuklenmisse version hakkinda bilgi verir yuklu degilse 'command not found' yazar / sudo yum autoremove git -y ==> yuklu olan git packagesini siler. -y ile onaylama vermeden direk siler
```
- Check if 'git' is installed on Ubuntu instance.
​
```bash
git --version # git otomatik default olarak yuklu gelir
```
- Install git on Amazon Linux instance.
​
```bash
sudo yum install git # linux makinaya git uygulamasini yukledik (1 package + 7 dependency )
```
- Uninstall git on Amazon Linux instance.
​
```bash
sudo yum remove git # git i silmemize ragmen bazi dependency ler kaldigi icin git --version komutu ile git yuklu gibi gorunur
```
- Install git on Amazon Linux instance without any interruption.
​
```bash
sudo yum install git -y
```
- Uninstall git on Amazon Linux instance without any interruption.
​
```bash
sudo yum remove git -y
```
- Check the version of git installed on Amazon Linux instance.(There should be no info, because it's just removed a minute ago)
​
```bash
git --version
```
- Explain why there is still version info.
- Install git on Amazon Linux instance without any interruption.
​
```bash
sudo yum install git -y
```
- Uninstall git with dependencies on Amazon Linux instance without any interruption.
​
```bash
sudo yum autoremove git -y # git i tamamen silmek icin kullanilir
```
- Check the version of git installed on Amazon Linux instance.(There should ne no info, because it's just removed a minute ago)
​
```bash
git --version
```
- Uninstall git on Ubuntu instance.
​
```bash
sudo apt remove git # git silinir ve version denilince dosya bulamaz
```
- Check the version of git installed on Ubuntu instance.(There should be no info, because it's just removed a minute ago)
​
```bash
git --version
```
- Install git on Ubuntu instance without any interruption.
​
```bash
sudo apt install git -y
```
- Uninstall git with dependencies on Ubuntu instance without any interruption.
​
```bash
sudo apt autoremove git -y 
```
- Check the info for the git package installed on Amazon Linux instance.
​
```bash
sudo yum info git
```
- Check the info for the git package installed on Ubuntu instance.
​
```bash
sudo apt info git
```
- List all available packages for Amazon Linux instance.
​
```bash
sudo yum list # kullanilabilir packageleri gostermektedir
```
- List all available packages for Ubuntu instance.
​
```bash
sudo apt list #  kullanilabilir packageleri gostermektedir
```
- List all available git packages for Amazon Linux instance.
​
```bash
sudo yum list git # git packagesi hakkinda bilgi vermektedir
```
- List all available git packages for Ubuntu instance.
​
```bash
sudo apt list git
```
- List all installed packages on Amazon Linux instance.
​
```bash
sudo yum list installed # localde yuklu olan package listesini verecektir
```
- List all installed packages on Ubuntu instance.
​
```bash
sudo apt list --installed # localde yuklu olan package listesini verecektir
```
- List all available versions of git packages on Amazon Linux instance.
​
```bash
sudo yum --showduplicates list git # yuklenebilecek repodaki git packageleri gosterir / eger git yuklu ise hangisinin yuklu oldugunu renklendirerek gosterecektir / eger spesifik bir git package yukleyeceksek sudo yum install git-..... (surumu yazilacak eger tire konulmazsa son surumu yukleyecektir)
```
- Check the version of git installed on Amazon Linux instance.
​
```bash
git --version
```
- Uninstall git with dependencies on Amazon Linux instance without any interruption.
​
```bash
sudo yum autoremove git -y
```
- Install a previous version of git on Amazon Linux instance.
​
```bash
sudo yum --showduplicates list git
sudo yum install git-2.14.5-1.amzn2 -y
```
- Check the version of git installed on Amazon Linux instance.
​
```bash
git --version
```
- List all available versions of git packages on Amazon Linux instance.
​
```bash
sudo yum --showduplicates list git
``` 
- Check the available version of git with info command.
​
```bash
sudo yum list git
```
- Update git and check the version.
​
```bash
sudo yum update git -y # son surume update eder
git --version
```
cat /etc/os-release # ==>cihazin adi versiyonu ve diger ozellikleri hakkidan ubuntu ve linux bilgi verir
rpm -ql git ==> git in yuklu oldugu yeri gosterir