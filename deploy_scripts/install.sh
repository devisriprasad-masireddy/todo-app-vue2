#!/bin/bash
source /home/ubuntu/.bash_profile
cd /home/ubuntu
node --version
if [ $? -ne 0 ]
then
    sudo apt update
    sudo apt install ruby
    sudo apt install wget
    cd /home/ubuntu
    sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
    sudo chmod +x ./install
    sudo ./install auto
    sudo apt install httpd
    sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install nodejs
    cd /home/www/html
    sudo npm i @vue/cli-service
fi
