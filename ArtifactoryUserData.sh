#!/bin/bash

sudo yum update -y
#Mount Drives
sudo yum install nfs-utils -y
mkdir /data/artifactory
mkdir /data/postgresql
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-9c619ad4.efs.us-east-1.amazonaws.com:/ /data/postgresql

#Pull Images
curl https://raw.githubusercontent.com/JFrogDev/artifactory-docker-examples/master/docker-compose/artifactory-oss-postgresql.yml > docker-compose.yml
docker-compose pull

#Kick Off Compose
docker-compose up
