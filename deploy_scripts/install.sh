#!/bin/bash
source /home/ec2-user/.bash_profile
cd /home/ec2-user
node --version
if [ $? -ne 0 ]
then
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
   . ~/.nvm/nvm.sh
   nvm install node
   npm run build
fi
