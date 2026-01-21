#!/bin/bash

# Deploy Backend Script
# This script builds and deploys the Golang backend to EC2

set -e

echo "Building backend..."

cd backend

# Build the application
go build -o main .

echo "Creating deployment package..."

# Create deployment directory
mkdir -p deployment
cp main deployment/
cp -r config/ deployment/ 2>/dev/null || true

# Create systemd service file
cat > deployment/starttech-backend.service << EOF
[Unit]
Description=StartTech Backend Service
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/opt/starttech-backend
ExecStart=/opt/starttech-backend/main
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "Deploying to EC2..."

# Note: Replace with your actual EC2 instance details
# scp -i your-key.pem -r deployment/ ubuntu@your-ec2-ip:/tmp/
# ssh -i your-key.pem ubuntu@your-ec2-ip "sudo systemctl stop starttech-backend; sudo rm -rf /opt/starttech-backend; sudo mv /tmp/deployment /opt/starttech-backend; sudo systemctl start starttech-backend"

echo "Backend deployment completed!"