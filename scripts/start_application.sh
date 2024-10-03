#!/bin/bash
cd /home/ec2-user/acebook-node-app
npm install

# Starts the Node.js application in production mode
npm run start:production > app.log 2>&1 &
# 'run start:production' run the application start command defined in package.json (specific for production)
# '> app.log' redirect standard output to a file called app.log rather than the terminal
# '2>&1' redirect standard error (where errors or warnings are printed) to app.log also
# '&' runs the command in the background, leaving terminal free for other commands