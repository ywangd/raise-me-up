#!/bin/bash

[[ "$SKIP_INIT" == "0" || -z $SKIP_INIT ]] && {
    echo 'Initialising'
    sudo apt update
    sudo apt-get install -y software-properties-common 
    sudo apt-get install -y python-pexpect
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible
    sudo apt --fix-broken install -y
}
pushd /tmp/raise-me-up/ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory/local.ini --vault-password-file password-wrapper.sh playbook.yml
