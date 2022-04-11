#!/bin/bash
source /var/www/html/.bash_profile
cd /home/ec2-user/todo-app
npm run build
cd dist
service httpd start
