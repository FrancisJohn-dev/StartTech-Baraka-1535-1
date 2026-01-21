#!/bin/bash

# Deploy Frontend Script
# This script builds and deploys the React frontend to S3

set -e

echo "Building frontend..."

cd frontend

# Install dependencies
npm install

# Build for production
npm run build

echo "Deploying to S3..."

# Sync to S3 (replace with your bucket name)
aws s3 sync build/ s3://your-frontend-bucket-name --delete

echo "Invalidating CloudFront cache..."

# Invalidate CloudFront (replace with your distribution ID)
aws cloudfront create-invalidation --distribution-id YOUR_DISTRIBUTION_ID --paths "/*"

echo "Frontend deployment completed!"