#!/bin/bash

case $(uname -v) in
    *Ubuntu*)
        OS=Ubuntu
        ;;
    *Darwin*)
        OS=Darwin
        ;;
    *)
        echo Unknown Operating System
        exit 1
        ;;
esac

doAnsible() {
    pushd ansible
    ansible-galaxy install -r requirements.yml
    ansible-playbook -i inventory/local.ini --vault-password-file password-wrapper.sh playbook.yml
}

upUbuntu() {
    [[ "$SKIP_INIT" == "0" || -z $SKIP_INIT ]] && {
        echo 'Bootstrapping Ansible'
        sudo apt update
        sudo apt-get install -y software-properties-common 
        sudo apt-get install -y python-pexpect
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt-get install -y ansible
        sudo apt --fix-broken install -y
    }
    doAnsible
}

case $OS in
    Ubuntu)
        up$OS
        ;;
    *)
        echo $OS: Operating System not supported yet
        exit 1
        ;;
esac
