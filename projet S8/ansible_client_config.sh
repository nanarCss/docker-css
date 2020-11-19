#!/bin/bash

useradd admin
echo "admin ALL=(ALL) NOPASSWD:ALL">> /etc/sudoers.d/admin
mkdir -p /home/admin/.ssh

useradd ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL">> /etc/sudoers.d/ansible
mkdir -p /home/ansible/.ssh

cat /home/vagrant/admin.pub >> /home/admin/.ssh/authorized_keys
rm /home/vagrant/admin.pub
chown -R admin:admin /home/admin
       
cat /home/vagrant/ansibleServer.pub >> /home/ansible/.ssh/authorized_keys
rm /home/vagrant/ansibleServer.pub
chown -R ansible:ansible /home/ansible
