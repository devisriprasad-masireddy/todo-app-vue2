#!/bin/bash
cd /var/www/html
npm run build
sudo service apache2 start
