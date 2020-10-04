#!bin/bash
# this script will run the docker image you choosen in parameter

# The docker image
DockIm=apache2-eseo
rt_pass=network
db=wordpress
mysql_container_name=mysqlDB
PORT=8080

# Stop and Delete containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# MySQL
docker run --name $mysql_container_name -e MYSQL_ROOT_PASSWORD=$rt_pass -e MYSQL_DATABASE=$db -d mysql:latest
# Run the docker image choose in parameter
docker run -d -p $PORT:80 -v /web:/var/www/localhost/htdocs pennarguear/$DockIm

# PhpMyAdmin --> just to check if DB is working
#docker run --name phpmyadmin -d --link mysqlDB:db -p 8081:80  phpmyadmin/phpmyadmin:5

# WordPress
#docker run --name CSSwordpress --link mysqlDB -p 80:80 -e WORDPRESS_DB_HOST=mysqlDB:3306 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=network -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_TABLE_PREFIX=wp_ -d wordpress
