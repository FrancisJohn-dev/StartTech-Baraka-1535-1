#!/bin/bash

# Rollback Script for Application
# This script rolls back the application to a previous version

set -e

echo "Starting application rollback..."

# Frontend rollback (restore previous S3 version)
echo "Rolling back frontend..."
aws s3 cp s3://your-frontend-bucket-name/backup/index.html s3://your-frontend-bucket-name/index.html
# Add more files as needed

# Backend rollback (revert to previous deployment)
echo "Rolling back backend..."
# ssh commands to restore previous version
# ssh ubuntu@your-ec2-ip "sudo systemctl stop starttech-backend; sudo cp /opt/starttech-backend/backup/main /opt/starttech-backend/main; sudo systemctl start starttech-backend"

echo "Application rollback completed."