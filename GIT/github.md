# Github Tek Klasörde Birden fazla remote Repo ile çalışma..
​
## Description:
​
-Lokal Bilgisayrınızda lokal repoda birden fazla remote repo kullanımı
​
## Problem Çözümü:
-ilk olarak Github repomuzda `clarusway-aws-8-21` -veya herhangi bir isim olabilir- a repo acıyoruz. 
​
-"Public" ya da "Private" istediginizi secebilirsiniz.
​
-"Initialize this repository with:" altındaki "add" lerden hicbirini secmiyoruz.
"Create Repository" tıklayarak repomuzu oluşturuyoruz.
​
- Bu oluşturduğumuz   'https://github.com/-ownusername-/clarusway-aws-8-21.git' repomuzu  bilgisayarımızda  `git clone` komutu ile  indiriyoruz.
​
```bash
git clone https://github.com/<burayı degistiriniz>/clarusway-aws-8-21.git
```
-Github repo Klasörünün içine giriyoruz
```bash
cd clarusway-aws-8-21
```
-Mevcut Remote path'leri görmek için
```bash
git remote -v
origin  https://github.com/<ownusername>/clarusway-aws-8-21.git (fetch)
origin  https://github.com/<ownusername>/clarusway-aws-8-21.git (push)
```
-Mevcut Remote path'lere clarusway'in path'ini ekliyouruz. ve 
```bash
git remote add clarusway https://github.com/clarusway/clarusway-aws-8-21.git
git remote -v
clarusway       https://github.com/clarusway/clarusway-aws-8-21.git (fetch)
clarusway       https://github.com/clarusway/clarusway-aws-8-21.git (push)
origin  https://github.com/<ownusername>/clarusway-aws-8-21.git (fetch)
origin  https://github.com/<ownusername>/clarusway-aws-8-21.git (push)
```
- Clarusway dosyalarını "pull" yapıyoruz.
```bash
git pull clarusway main
```
- Clarusway reposundan indirdiğimiz dosyaları kendi repomuza yuklemek için ilk olarak brach "main yapıyoruz. ve `--set-upstream`
secenegi ile upstream yapacagımız path'i belirliyoruz.
  
```bash
git branch -M main
git push --set-upstream origin main
```
- Lokal bilgisayarımızda 2 Remote path kurduk. Clarusway remote pathimizde degisikleri almak icin 'git pull' komutunu kullandıgımızda "MERGEMSG" hatası verebilir. 
  Vi dosyası olduğu icin escape ve ":q" ile cıkabiliriz.
  Hatayı görmek istemiyorsanız '--no-edit"  yazmanız gerekmektedir.
  
```bash
git pull clarusway main
git pull clarusway main --no-edit
``` 
- Kendi repomuzdan 'pull' yapmak için asagıdaki komutları kullanırız.
```bash
git pull origin main
```
Ya da...
```bash
git pull 
```
​
- Kendi repomuza yuklemek için asagıdaki komutları kullanırız.
```bash
git add .
git commit -m "update"
git push
```
​
​
​
​
Daha detaylı bilgi almak isterseniz Mehmet arkadaşımızın yapmış olduğu youtube videosunu izleyebilirsiniz.
​
https://www.youtube.com/watch?v=rZsiPYXbiy8