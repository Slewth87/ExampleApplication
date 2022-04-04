#!/usr/bin/env/env bash
# Check if there's an instance with the image getting deployed
CURRENT_INSTANCE=$(docker ps -a -q --filter ancestor="$IMAGE_NAME" --format"{{.ID}}")

# If there is an instance, stop it
if [ "$CURRENT_INSTANCE" ]
then
    docker rm $(docker stop $CURRENT_INSTANCE)
fi

# Grab the instance from docker hub
docker pull $IMAGE_NAME

# Check for a container named $CONTAINER_NAME, and remove it if it's there
CONTAINER_EXISTS=$(docker ps -a | grep $CONTAINER_NAME)
if [ "$CONTAINER_EXISTS" ]
then
    docker rm $CONTAINER_NAME
fi

# Create a new $CONTAINER_NAME on port 2814
docker create -p 2814:2814 --name $CONTAINER_NAME $IMAGE_NAME
# Write the keys and certs
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Put the keys and certs in the docker container
docker cp ./privatekey.pem $CONTAINER_NAME:/privatekey.pem
docker cp ./server.crt $CONTAINER_NAME:/server.crt

# Start 'er up
docker start $CONTAINER_NAME


# Old deploy script:

# sudo apt update && sudo apt install nodejs npm
# # Install pm2 which is a production process manager for Node.js with a built-in load balancer.
# sudo npm install -g pm2
# # Stop any instance of our application currently running
# pm2 stop example_app
# # Change Directory into folder where application is downloaded
# pwd
# cd ExampleApplication
# pwd
# # Install dependencies
# npm install
# echo $PRIVATE_KEY > privatekey.pem
# echo $SERVER > server.crt
# # Start with pm2
# pm2 start ./bin/www --name example_app