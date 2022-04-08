#!/bin/bash
source /home/ec2-user/.bash_profile
cd /home/ec2-user/todo-app
NODE_ENV=production npm start > /dev/null 2> /dev/null < /dev/null &