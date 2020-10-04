#!bin/sh
# This script will build the image of dockerfile choosen
dockerfile=apache2-eseo

#docker build -t eseo/$dockerfile - < $dockerfile
docker build -t pennarguear/$dockerfile - < $dockerfile
