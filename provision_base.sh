#############################################################Wordpress install
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo apt install nginx unzip php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
cd wordpress/
sudo cp -r * /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
cd /etc/nginx/sites-enabled/
sudo wget https://raw.githubusercontent.com/prajwalakhuj/wordpress-codepipeline/main/nginx/wordpress.conf
sudo rm -rf default
sudo systemctl reload php7.4-fpm.service
sudo systemctl restart nginx
cd ~


####################################For AWS CloudWatch Agent Install
sudo apt update
sudo apt install ruby-full -y
sudo apt install wget
cd $HOME
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
