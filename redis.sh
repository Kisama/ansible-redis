#!/bin/bash

inventory_file=$1
key_file=sds-nxs.pem

ping_response=$(ansible -i $inventory_file all -m ping --key-file=$key_file)
if [ $? -ne 0 ] ; then
    >&2 echo "${ping_response}"
    exit 1
fi

ansible-playbook -i $inventory_file site.yml --key-file=$key_file --ask-become-pass
