#!/bin/bash

# Redirect all output to a log file (also display in terminal in real-time)
exec > >(tee -a /home/ec2-user/deploy_log.txt)

echo "Starting application deployment process..."

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Use Node.js 16
nvm use 16

cd /home/ec2-user/acebook-node-app
echo "Changed to application directory"

echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"

echo "Installing dependencies..."
npm install
echo "Finished npm install"

echo "Starting application..."
# Starts the Node.js application in production mode
npm run start:production > app.log 2>&1 &
# 'run start:production' run the application start command defined in package.json (specific for production)
# '> app.log' redirect standard output to a file called app.log rather than the terminal
# '2>&1' redirect standard error (where errors or warnings are printed) to app.log also
# '&' runs the command in the background, leaving terminal free for other commands
echo "Application start command executed"

echo "Deployment process completed"