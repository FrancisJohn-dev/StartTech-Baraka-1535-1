#!/bin/bash

# Health Check Script for Application
# This script performs health checks on the deployed application

set -e

# Frontend health check (CloudFront/S3)
FRONTEND_URL="https://your-cloudfront-domain.com"
echo "Checking frontend health..."
curl -f -s "$FRONTEND_URL" > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Frontend is healthy"
else
    echo "❌ Frontend health check failed"
    exit 1
fi

# Backend health check (ALB)
BACKEND_URL="http://your-alb-dns-name/health"
echo "Checking backend health..."
curl -f -s "$BACKEND_URL" > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Backend is healthy"
else
    echo "❌ Backend health check failed"
    exit 1
fi

echo "All application health checks passed!"