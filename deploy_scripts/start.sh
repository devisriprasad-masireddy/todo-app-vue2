#!/bin/bash
source /var/www/html/public/
cd /var/www/html/public
npm run build
sudo service httpd start
