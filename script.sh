#!/bin/bash
ssh -o StrictHostKeyChecking=no -i ../../webserver.pem ubuntu@52.90.170.30 'cd ansible_project &&
       ansible-playbook vpro_ec2_stack.yaml &&
       ansible-playbook -i inventory-bastion bastion_setup.yaml &&
       ./script_part2.sh && exit 0 && exit; exec bash -lxe'
