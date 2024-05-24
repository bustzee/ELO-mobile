#-----INSTALL NGINX AND PHP8.2FPM--------
sudo apt install -y zip unzip
sudo apt install -y nginx 
sudo apt install -y software-properties-common
sudo apt update -y 
sudo apt install -y php8.2-fpm php8.2
sudo apt install -y mysql-server
sudo apt-get install -y php-xml
sudo systemctl start php8.2-fpm
sudo systemctl start mysql
sudo apt-get install -y php-mysql
sudo apt-get install -y php-gd
sudo systemctl restart php8.2-fpm
#----------------------------------------

#-----UNZIP FILES------------------------
unzip data.zip
#----------------------------------------

#-----MKDIR AND COPY FILES------------
sudo mkdir /var/www/phpmyadmin
sudo mkdir /var/www/elo-sports
sudo mkdir /etc/nginx/ssl/
sudo cp -r data/ssl/* /etc/nginx/ssl/
sudo cp -r data/phpmyadmin/* /var/www/phpmyadmin/
sudo cp -r data/elo-sports/* /var/www/elo-sports/
sudo chmod -R 777 /var/www
#----------------------------------------

#-----MYSQL CONFIG-----------------------
sudo mysql -u root --password=root < sql-schema.sql
#----------------------------------------

#-----NGINX CONFIG-----------------------
sudo cp -r data/elo-new.conf /etc/nginx/sites-enabled/
sudo systemctl start nginx
#----------------------------------------

#-----SEED THE DB------------------------
sudo mysql -u root --password=root -p elo_sports < elo_sports.sql
#----------------------------------------

#-----COPY THE ENV------------------------
sudo cp ./env /var/www/elo-sports/.env
#----------------------------------------

#----Enable Services and Handles---------
sudo systemctl enable nginx
sudo systemctl enable php8.2-fpm
sudo systemctl enable mysql
#----------------------------------------

#-----WEBSOCKETS START-------------------
sudo apt install -y php-curl
sudo cp websocket.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start websocket
sudo systemctl enable websocket
#----------------------------------------
