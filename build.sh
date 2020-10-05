#!bin/sh
# This script will build the image of dockerfile choosen

# The name of the Dockerfile
dockerfile=apache2-eseo

docker build -t pennarguear/$dockerfile - < $dockerfile
