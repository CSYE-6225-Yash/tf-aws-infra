#!/bin/bash
cd /opt/csye6225/webapp
echo "DATABASE_NAME=${dbname}" >> .env
echo "DATABASE_USER=${db_username}" >> .env
echo "DATABASE_PASSWORD=${db_password}" >> .env
echo "DATABASE_Host=${db_host}" >> .env
echo "DATABASE_PORT=${db_port}" >> .env
echo "BUCKET_NAME=${bucket_name}" >> .env
sudo systemctl start webapp.service
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/cloudwatch-agent-config.json