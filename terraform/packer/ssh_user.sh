#!/bin/bash

key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9ifi3aPABVf3wn5lBE62OvDk5vOuo9fqu9q5t9eJHY6ibJkkJjEXNglTTXjIlAwKxA0Y/m8foxXY0i4g0aqtbUKLzx0B7epOrvsLIvR2zSyH/sDjaEagQA9/5F9nW6I5Xpvfam4icFS4oP6CE4z99vlqbS4S5JFV2avCn5uWYLIb/ckaB+Eal06mNnqj/zeFhwtU7i0hWXu8EyPad7CwFWUpRd2VBmAvAk9JQKznQ4PDQixhZDnRWB4tIWXZe61Xv3o7gWTZZ1cDfpp46tPwMy5G4G9ili8GrHJzBskMRxyxwQ+bkFz0Tu/OJihwauAO722LDnEYxG0bDVWPboXQ96TPEicAu4v/pG7pMRvRw/L8n8Rj4YGt68LAB92SlTCskteKxhB3RtHfoDGZqrNTWG0P+j+uw5gmujmt1gaMbS32mlEglLe+qSJqJoAV9NZdQarKvPaiJa11WDOM4f1Owv5RA0q/4PEY/VwDmNT53FDO2AT1JpeTBWBC7Uyd4HQaqpftKCRpXnZbXA7TERqIVg9vYxbmcwxTrOLNw5FxRK5cbgC3+ejZlT1wW0sFcpu7TeH1neBz+g/vjKApyVFrMxZgyx9boi7JpKe6dRFhn91vO2aPcooISQaDmu6BxSJd+4meDepPifDJY5ZTqbvOrCihcJH9Rx399xyD6cGcx4w== irobot@ws001'
ssh_usr=netology

sudo groupadd sudo
sudo useradd -G sudo -m $ssh_usr
echo "$ssh_usr ALL=(ALL) NOPASSWD: ALL"  | sudo tee -a /etc/sudoers
sudo mkdir -p /home/$ssh_usr/.ssh
echo "$key" | sudo tee /home/$ssh_usr/.ssh/authorized_keys
sudo chown -R $ssh_usr:$ssh_usr /home/$ssh_usr/.ssh
