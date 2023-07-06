#!/bin/bash
function cleanup() {
  echo "Exiting.."
}
ssh -o StrictHostKeyChecking=no -i ../../webserver.pem ubuntu@54.161.139.188 'cd ansible_project &&
       sudo ansible-playbook site.yaml &&
       sudo ansible-playbook vpro_ec2_stack.yaml &&
       sudo ansible-playbook bastion_setup.yaml && 
       ./script_part2.sh && exit 0 && exit; exec bash -lx'

trap 'trap SIGINT; kill -s SIGINT "$$"' SIGINT; trap cleanup EXIT
