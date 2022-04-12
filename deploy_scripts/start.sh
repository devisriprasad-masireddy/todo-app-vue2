#!/bin/bash
source /var/www/html/public/.bash_profile
cd /var/www/html/public
npm run build
sudo service httpd start
