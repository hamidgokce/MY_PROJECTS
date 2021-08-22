chmod 400 key.pem
ssh -i key.pem ec2-user@dns_name <or> public IP
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd -y
sudo systemctl status httpd -y
sudo chmod -777 /var/www/html
cd /var/www/html 
echo "Hello Clarusway" > /var/www/html/index.html
