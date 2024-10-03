#!/bin/bash

# Redirect all output to a log file
exec > >(tee -a /home/ec2-user/nodejs_install_log.txt) 2>&1

# Installation steps here: https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/setting-up-node-on-ec2-instance.html
# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Reload bashrc to make nvm available
source ~/.bashrc

# Install the latest version of Node.js
nvm install --lts

# Verify the Node.js version
node -e "console.log('Running Node.js ' + process.version)"