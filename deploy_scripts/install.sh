#!/bin/bash
source /home/ubuntu/.bash_profile
cd /home/ubuntu
node --version
if [ $? -ne 0 ]
then
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
   . ~/.nvm/nvm.sh
   nvm install node
fi
cd /var/www/html/public
sudo rm index.html
