#!/usr/bin/env/env bash
sudo apt update && sudo apt install nodejs npm
# Install pm2 which is a production process manager for Node.js with a built-in load balancer.
sudo npm install -g pm2
# Stop any instance of our application currently running
pm2 stop 0
pm2 stop example_app
pm2 stop rduffylab3
# Change Directory into folder where application is downloaded
cd rduffylab3
# Install dependencies
npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt
# Start with pm2
pm2 start ./bin/www --name rduffylab3