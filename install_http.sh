
#!/bin/sh
sudo su
yum update -y
yum -y install httpd
systemctl enable httpd.service
systemctl start httpd.service
echo "<h1>This is my webpage on IP:$(localhost)</h1>" > /var/www/html/index.html

