#!/bin/bash

# Update the package lists
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Ensure Apache is started
sudo systemctl start apache2

# Enable Apache to run on boot
sudo systemctl enable apache2

# Install necessary packages
sudo apt-get -y install ruby wget

# Download and install the CodeDeploy agent
cd /home/ubuntu
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# Install Python pip and AWS CLI
sudo apt-get -y install python3-pip
sudo pip3 install awscli

# Start the CodeDeploy agent
sudo service codedeploy-agent start

# Enable the CodeDeploy agent to start on boot
sudo systemctl enable codedeploy-agent

