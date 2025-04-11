#!/bin/bash
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
db_password=$(./aws/dist/aws secretsmanager get-secret-value --secret-id ${secret_id} --query SecretString --output text | grep -o '"dbPass":"[^"]*' | grep -o '[^"]*$')
cd /opt/csye6225/webapp
echo "DATABASE_NAME=${dbname}" >> .env
echo "DATABASE_USER=${db_username}" >> .env
echo "DATABASE_PASSWORD=$db_password" >> .env
echo "DATABASE_Host=${db_host}" >> .env
echo "DATABASE_PORT=${db_port}" >> .env
echo "BUCKET_NAME=${bucket_name}" >> .env
sudo systemctl start webapp.service
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/cloudwatch-agent-config.json