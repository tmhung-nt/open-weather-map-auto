#!/bin/sh

find . -type f -iname "*.sh" -exec chmod +x {} \;


docker pull elgalu/selenium

clear

echo "start zalenium"
docker-compose up -d hub

echo "run test"
docker-compose run robot

echo "Sleep 10 second(s)"
sleep 10

docker-compose down