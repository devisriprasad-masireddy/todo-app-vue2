#!/bin/bash
source /home/ubuntu/.bash_profile
cd /home/ubuntu
node --version
if [ $? -ne 0 ]
then
    sudo apt -y update
    sudo apt -y install ruby
    sudo apt install wget
    cd /home/ubuntu
    wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
    sudo apt install apache2
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install nodejs
    cd /var/www/html
    sudo npm i @vue/cli-service
fi
