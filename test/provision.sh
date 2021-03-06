#!/bin/bash
set -u -e                      
# TBD: use playbooks for this
modprobe overlay || true
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' >/etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine git build-essential curl
usermod -aG docker vagrant
echo "DOCKER_OPTS='--storage-driver=overlay2'" > /etc/default/docker
service docker restart
