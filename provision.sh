#!/usr/bin/env bash

echo "Beginning provisioning"
sudo apt-get update
export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
locale-gen en_GB.UTF-8
sudo dpkg-reconfigure locales
sudo apt-get install -y vim curl python-software-properties lynx
sudo apt-get install -y nginx php5-fpm
sudo apt-get install -y php5-memcache memcached php-apc

echo "Configuring nginx vhost"
sudo rm /etc/nginx/sites-enabled/default
cat << EOF | sudo tee -a /etc/nginx/sites-enabled/default-site
server {
    listen *:80;
    root /var/www;
    index index.html index.htm index.php;
    try_files \$uri \$uri/ /index.php?\$query_string;
    sendfile off;

    # It's always good to set logs, note however you cannot turn off the error log
    # setting error_log off; will simply create a file called 'off'.
    access_log /var/log/nginx/example.access.log;
    error_log /var/log/nginx/example.error.log;

    location ~ ^/index\.php$ {
        include fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
EOF

echo "Configuring nginx"
sudo service nginx restart
sudo service php5-fpm restart

echo "Install MailCatcher"
sudo apt-get install -y build-essential
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y ruby1.9.3
sudo gem install mailcatcher

# in case it's already running, kill it
sudo pkill mailcatcher

# start it (again), listening on all IPs
sudo mailcatcher --http-ip 0.0.0.0