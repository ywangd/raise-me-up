#!/bin/bash

set -x

doAnsible() {
    ansible-galaxy install -r ansible/requirements.yml
    ansible-playbook -i ${INVENTORY_FILE} ansible/playbook.yml
}

upUbuntu() {
    [[ "$SKIP_INIT" == "0" || -z $SKIP_INIT ]] && {
        echo 'Bootstrapping Ansible'
        sudo test -f "/etc/sudoers.d/$USER" || sudo cat > "/etc/sudoers.d/$USER" <<EOF
$USER ALL=(ALL) NOPASSWD:ALL
EOF
        sudo apt update
        sudo apt-get install -y software-properties-common 
        sudo apt-get install -y python-pexpect
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt-get install -y ansible
        sudo apt --fix-broken install -y
    }
    doAnsible
}

upDarwin() {
    echo "MacOS not supported yet"
    exit 1
}

INVENTORY_FILE='ansible/inventory/default.yml'
while getopts ":i:" opt; do
    case $opt in
        i)
            INVENTORY_FILE=${OPTARG}
            ;;
    esac
done
shift $((OPTIND-1))

case $(uname -v) in
    *Ubuntu*)
        upUbuntu
        ;;
    *Darwin*)
        upDarwin
        ;;
    *)
        echo "Unknown Operating System"
        exit 1
        ;;
esac

