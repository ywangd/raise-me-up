#!/bin/bash

[[ ! SKIP_INIT ]] && {
    sudo apt update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible
}
pushd /tmp/raise-me-up/ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory/local.ini --vault-password-file password-wrapper.sh playbook.yml
