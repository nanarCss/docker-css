[ ! -e /usr/bin/expect ] && { apt-get -y install expect; }

echo "secure mysql"

SECURE_MYSQL=$(expect -c "

set timeout 10
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none): \"
send \"n\r\"
expect \"Change the root password? \[Y/n\] \"
send \"y\r\"
expect \"New password: \"
send \"N3twork!\r\"
expect \"Re-enter new password: \"
send \"N3twork!\r\"
expect \"Remove anonymous users? \[Y/n\] \"
send \"y\r\"
expect \"Disallow root login remotely? \[Y/n\] \"
send \"exity\r\"
expect \"Remove test database and access to it? \[Y/n\] \"
send \"y\r\"
expect \"Reload privilege tables now? \[Y/n\] \"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"
