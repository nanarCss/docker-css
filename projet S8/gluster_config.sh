[ ! -e /usr/bin/expect ] && { apt-get -y install expect; }

echo "Install Gluster-server"
sudo apt install -y glusterfs-server
sudo apt-mark hold glusterfs*
sudo systemctl start glusterd.service
sudo systemctl enable glusterd.service

#(echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/sdc
CREATE_PARTITION=$(expect -c "

set timeout 10
spawn sudo fdisk /dev/sdb

expect \"Command (m for help): \"
send \"n\r\"
expect \"Select (default p): \"
send \"p\r\"
expect \"Partition number (1-4, default 1): \"
send \"1\r\"
expect \"First sector (2048-10485759, default 2048): \"
send \"2048\r\"
expect \"Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-10485759, default 10485759): \"
send \"10485759\r\"
expect \"Command (m for help): \"
send \"w\r\"
expect eof
")

echo "$CREATE_PARTITION"

sudo mkfs.ext4 /dev/sdb1
sudo mkdir -p /data/gluster/
sudo echo "/dev/sdb1 /data/gluster ext4 defaults 1 2" >> /etc/fstab
sudo mount -a
