#-----INSTALL NGINX ---------------------
sudo apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev
sudo apt install -y zlib1g-dev
cd ..
wget https://nginx.org/download/nginx-1.24.0.tar.gz
tar -xf nginx-1.24.0.tar.gz
sudo git clone https://github.com/arut/nginx-rtmp-module.git
cd nginx-1.24.0
./configure --with-http_v2_module --with-http_ssl_module --add-module=../nginx-rtmp-module
make -j 1
sudo make install
cd ..
cd elo-esports.com_deploy/
sudo rm /usr/local/nginx/conf/nginx.conf
sudo cp nginx.conf /usr/local/nginx/conf/
sudo cp -r nginx.service /etc/systemd/system/
sudo mkdir /nginx/
sudo mkdir /nginx/hls
sudo mkdir /nginx/hls-dev
sudo mkdir /nginx/hls-uat/
sudo mkdir /usr/local/nginx/conf/ssl/
sudo cp -r ssl/* /usr/local/nginx/conf/ssl/
sudo mkdir /var/www
sudo mkdir /var/www/streams
sudo chmod -R 777 /var/www/streams
sudo apt-get install -y ffmpeg
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo cp ./run.sh /opt/
sudo chmod +rx /opt/run.sh
#----------------------------------------
