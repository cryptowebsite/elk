#!/usr/bin/bash

declare -A containers=( ["ubuntu"]="pycontribs/ubuntu" ["centos7"]="centos:centos7" ["fedora"]="pycontribs/fedora" )

for container in "${!containers[@]}";
do
  docker run --name "$container" -d "${containers[$container]}" tail -f /dev/null
done

ansible-playbook -i inventory/prod.yml --ask-vault-password site.yml

for container in "${!containers[@]}";
do
  docker stop "$container"
  docker rm "$container"
done
