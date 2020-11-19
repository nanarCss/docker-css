#!/bin/bash

cat /home/vagrant/admin.pub >> /home/admin/.ssh/authorized_keys
rm /home/vagrant/admin.pub
chown -R admin:admin /home/admin

mv /home/vagrant/ansibleServer /home/admin/.ssh/
chown -R admin:admin /home/admin
       
sed -i "s/#remote_user = root/remote_user = ansible/g" /etc/ansible/ansible.cfg
sed -i "s?#private_key_file = /path/to/file?private_key_file = /home/admin/.ssh/ansibleServer?g" /etc/ansible/ansible.cfg
sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg


# REFRESH ANSIBLE HOSTS
rm /etc/ansible/hosts
touch /etc/ansible/hosts

echo "[srv-nat]">> /etc/ansible/hosts
echo "10.10.1.99" >> /etc/ansible/hosts

echo "[srv-dns-master]">> /etc/ansible/hosts
echo "10.10.1.2" >> /etc/ansible/hosts
echo "[srv-dns-slave]">> /etc/ansible/hosts
echo "10.10.1.3" >> /etc/ansible/hosts

echo "[srv-dhcp-master]">> /etc/ansible/hosts
echo "10.10.1.6" >> /etc/ansible/hosts
echo "[srv-dhcp-slave]">> /etc/ansible/hosts
echo "10.10.1.7" >> /etc/ansible/hosts

echo "[srv-mail]">> /etc/ansible/hosts
echo "10.10.1.10" >> /etc/ansible/hosts

echo "[srv-proxy-1]">> /etc/ansible/hosts
echo "10.10.1.15" >> /etc/ansible/hosts
echo "[srv-proxy-2]">> /etc/ansible/hosts
echo "10.10.1.16" >> /etc/ansible/hosts

echo "[srv-web-1]">> /etc/ansible/hosts
echo "10.10.1.21" >> /etc/ansible/hosts
echo "[srv-web-2]">> /etc/ansible/hosts
echo "10.10.1.22" >> /etc/ansible/hosts

echo "[srv-database-1]">> /etc/ansible/hosts
echo "10.10.1.31" >> /etc/ansible/hosts
echo "[srv-database-2]">> /etc/ansible/hosts
echo "10.10.1.32" >> /etc/ansible/hosts
echo "[srv-database-3]">> /etc/ansible/hosts
echo "10.10.1.33" >> /etc/ansible/hosts

echo "[srv-nfs]">> /etc/ansible/hosts
echo "10.10.1.40" >> /etc/ansible/hosts

echo "[srv-backup]">> /etc/ansible/hosts
echo "10.10.1.41" >> /etc/ansible/hosts

echo "[srv-zabbix]">> /etc/ansible/hosts
echo "10.10.1.50" >> /etc/ansible/hosts

echo "[zabbix-agent]">> /etc/ansible/hosts
echo "10.10.1.99" >> /etc/ansible/hosts
echo "10.10.1.2" >> /etc/ansible/hosts
echo "10.10.1.3" >> /etc/ansible/hosts
echo "10.10.1.6" >> /etc/ansible/hosts
echo "10.10.1.7" >> /etc/ansible/hosts
echo "10.10.1.10" >> /etc/ansible/hosts
echo "10.10.1.15" >> /etc/ansible/hosts
echo "10.10.1.16" >> /etc/ansible/hosts
echo "10.10.1.21" >> /etc/ansible/hosts
echo "10.10.1.22" >> /etc/ansible/hosts
echo "10.10.1.31" >> /etc/ansible/hosts
echo "10.10.1.32" >> /etc/ansible/hosts
echo "10.10.1.33" >> /etc/ansible/hosts
echo "10.10.1.40" >> /etc/ansible/hosts
echo "10.10.1.41" >> /etc/ansible/hosts


cd /home/vagrant
    
    
# LAUNCH ANSIBLE PLAYBOOK (ORDER REQUIRE)

ansible-playbook nat.yml
ansible-playbook nfs.yml

ansible-playbook dns_master.yml
ansible-playbook dns_slave.yml

ansible-playbook dhcp_master.yml
ansible-playbook dhcp_slave.yml

ansible-playbook mail.yml

ansible-playbook database-1.yml
ansible-playbook database-2.yml
ansible-playbook database-3.yml
ansible-playbook start_cluster_db1.yml
ansible-playbook start_cluster_db2.yml
ansible-playbook start_cluster_db3.yml

ansible-playbook web-1.yml
ansible-playbook web-2.yml
ansible-playbook gluster-web-1.yml
ansible-playbook gluster-web-2.yml

ansible-playbook proxy-1.yml
ansible-playbook proxy-2.yml

ansible-playbook zabbix.yml
ansible-playbook zabbix-agent.yml
ansible-playbook backup.yml
