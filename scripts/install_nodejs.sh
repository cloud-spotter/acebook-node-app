#!/bin/bash

# Redirect all output to a log file
exec > >(tee -a /home/ec2-user/nodejs_install_log.txt) 2>&1

# Installation steps here: https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/setting-up-node-on-ec2-instance.html
# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Reload bashrc to make nvm available
# source ~/.bashrc 
# TODO: delete debugging statements here. Above command wasn't sufficient? Install log has a Close and open your terminal to
# start using nvm or run the following to use it now: (with commands below)

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js version 18 (newer versions cause a GLIBC version conflict)
echo "Installing Node.js version 18..."
nvm install 18

# Use the installed version
nvm use 18

echo "Node.js installed successfully. Version: $(node -v)"
echo "npm version: $(npm -v)"

# Verify the Node.js version
node -e "console.log('Running Node.js ' + process.version)"