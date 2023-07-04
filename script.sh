#!/bin/bash
ssh -o StrictHostKeyChecking=no -i ./bastion-key.pem ubuntu@3.90.207.141 'cd ansible_project/provision_stack && echo "executing ansible-playbook" && sudo ansible-playbook -v site.yaml && exit; exec bash -l'
