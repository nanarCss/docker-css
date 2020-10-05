#!bin/bash
# this script will run the docker image you choosen in parameter

# The docker image
DockIm=apache2-eseo
rt_pass=network
db=wordpress
mysql_container_name=db
PORT=8080
nomApache=apacheWPHP
user=wordpress
MDP=network
MYSQL_version=5.7.31


# MySQL
docker run --name $mysql_container_name -p 3306:3306 -e MYSQL_ROOT_PASSWORD=$rt_pass -e MYSQL_DATABASE=$db -d mysql:$MYSQL_version
# Apache / WordPress / PhpMyAdmin
docker run --name $nomApache -d -p $PORT:80 --link db:db -v /web:/var/www/localhost/htdocs pennarguear/$DockIm
