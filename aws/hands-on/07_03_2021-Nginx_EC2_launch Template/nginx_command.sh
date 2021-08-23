sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y 
sudo systemctl start nginx
sudo systemctl status nginx
cd  /usr/share/nginx/html
sudo chmod -R 777  /usr/share/nginx/html
rm index.html
ls
wget https://raw.githubusercontent.com/hamidgokce/MY_PROJECTS/main/projects/Project-001-Roman-Numerals-Converter/templates/index.html
wget https://raw.githubusercontent.com/hamidgokce/MY_PROJECTS/main/projects/Project-001-Roman-Numerals-Converter/templates/ryu.jpg

