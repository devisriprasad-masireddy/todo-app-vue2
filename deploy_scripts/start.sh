#!/bin/bash
cd /var/www/html/public
npm run build
sudo service apache2 start
