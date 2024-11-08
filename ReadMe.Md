#Ansible Topics
Ubuntu 22.04 
Installing Ansible :
apt install -y unzip net-tools jq
sudo apt update
sudo apt install software-properties-common
sudo ass-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
ansible-config init --disabled > ansible.cfg


0.Enable call backs in ansible.cfg
[defaults]
host_key_checking-False
remote_user=ubuntu
private_key_file=/etc/ansible/ansiblekey.pem
callbacks_enabled = timer, profile_tasks, profile_roles
#The above provided playbook and task excution time which can allow us to identiy
slow running playbooks.
Enable Ansible Log in export ANSIBLE_LOG_PATH=~/ansible.log
export ANSIBLE_DEBUG=True

1.Adoc Commands 
ansible -i invfile pvt -m ping   (#use to ping the all private servers)
ansible -i invfile pub -m ping   (#use to ping all the public servers)
ansible -i invfile all -m ping   (to come all the files)
ansible -i invfile all -m ping -f 1  (loaad one by one)
ansible -i invfile.yaml pvt -m shell -a "df -h"
ansible -i invfile pvt -m shell -a "df -h |grep -i /dev/root" -vvv (to identify any problem  for the VERBOSE)
ansible -i invfile server01:server02 -m shell -a "df -h | grep -i /dev/root"  (to target a server)
ansible -i invfile 'all:!server01' -m shell -a "df -h | grep -i /dev/root"
ansible -i invfile 'all:&megastar' -m shell -a "df -h | grep -i /dev/root"
ansible -i invfile2 'all:&megastar' -m shell -a "df -h | grep -i /dev/root"
ansible -i invfile pvt -m user -a "name=superstar state-present"  --become  (to create the user)
ansible -i invfile pvt -m shell -a "cat /etc/passwd | grep -i superstar"
ansible -i invfile pvt -m setup     (prints ansible_facts for client)






