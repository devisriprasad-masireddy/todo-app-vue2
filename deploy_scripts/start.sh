#!/bin/bash
source /var/www/html/.bash_profile
cd /home/ec2-user/todo-app
npm run build
service httpd start
