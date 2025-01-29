#!/bin/bash

# Create new user
NEW_USER="myuser"
PASSWORD="123456"

# Create user with home directory (-m) and bash shell (-s)
useradd -m -s /bin/bash $NEW_USER

# Set password
echo "$NEW_USER:$PASSWORD" | chpasswd

# Add to sudo group
usermod -aG sudo $NEW_USER

# Set up SSH key (recommended over password)
mkdir -p /home/$NEW_USER/.ssh
chmod 700 /home/$NEW_USER/.ssh

# Add your public key
echo "ssh-rsa AAAA..." > /home/$NEW_USER/.ssh/authorized_keys
chmod 600 /home/$NEW_USER/.ssh/authorized_keys
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh

# Update and install some basic packages if needed
apt-get update
apt-get install -y vim curl wget

# Optional: Disable root SSH login for security
#sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
#systemctl restart sshd