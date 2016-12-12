#!/bin/bash

echo "Stopping services"

ssh -o StrictHostKeyChecking=no -i "~/ec2-lykill.pem" ec2-user@ec2-52-50-152-101.eu-west-1.compute.amazonaws.com "docker-compose stop"