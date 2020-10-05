#!bin/bash
# this script will run the docker image you choosen in parameter

# The docker image
DockIm=apache2-eseo
rt_pass=network
db=wordpress
mysql_container_name=mysqlDB
PORT=8080

# MySQL
docker run --name $mysql_container_name -e MYSQL_ROOT_PASSWORD=$rt_pass -e MYSQL_DATABASE=$db -d mysql:5.7.31
# Apache / WordPress / PhpMyAdmin
docker run -d -p $PORT:80 -v /web:/var/www/localhost/htdocs pennarguear/$DockIm

# docker-compose up -d
