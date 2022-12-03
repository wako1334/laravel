#!/bin/bash
# Set permissions to storage and bootstrap cache
sudo chown -R www-data.www-data /var/www/html/storage
sudo chown -R www-data.www-data /var/www/html/bootstrap/cache
cd /var/www/html
# Run composer
sudo composer install
#configure .env - conexao com o banco
sudo mv .env.example .env
sudo sed -i 's/DB_DATABASE.*/DB_DATABASE=forum/g' .env
sudo sed -i 's/DB_USERNAME.*/DB_USERNAME=son/g' .env
sudo sed -i 's/DB_PASSWORD.*/DB_PASSWORD=schoolofnet/g' .env
# Run artisan commands
sudo php /var/www/html/artisan key:generate
sudo php /var/www/html/artisan migrate