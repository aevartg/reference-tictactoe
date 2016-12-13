#!/bin/bash

ssh -o StrictHostKeyChecking=no -i "~/ec2-lykill.pem" ec2-user@ec2-52-50-152-101.eu-west-1.compute.amazonaws.com "docker-compose stop"

scp -o StrictHostKeyChecking=no -i "~/ec2-lykill.pem" /var/lib/jenkins/workspace/Commit\ stage/docker-compose.yml /var/lib/jenkins/workspace/Commit\ stage/build/.env ec2-user@ec2-52-50-152-101.eu-west-1.compute.amazonaws.com:.
ssh -o StrictHostKeyChecking=no -i "~/ec2-lykill.pem" ec2-user@ec2-52-50-152-101.eu-west-1.compute.amazonaws.com "docker-compose up -d"