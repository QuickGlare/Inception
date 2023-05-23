echo "[Inception-Wordpress] Downloading Wordpress..."

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar core download --allow-root

mv wp-config-sample.php wp-config.php

sed "s/database_name_here/$MYSQL_WORDPRESS_DATABASE/1" -i -r wp-config.php
sed "s/username_here/$MYSQL_USERNAME/1" -i -r wp-config.php
sed "s/password_here/$MYSQL_PASSWORD/1" -i -r wp-config.php
sed "s/localhost/mariadb/1" -i -r wp-config.php

php wp-cli.phar core install --url=$WORDPRESS_DOMAIN_NAME/ --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USERNAME --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
php wp-cli.phar user create $WORDPRESS_USER_USERNAME $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

rm wp-cli.phar

/usr/sbin/php-fpm81 -F