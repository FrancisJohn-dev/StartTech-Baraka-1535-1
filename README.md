# StartTech Application

A full-stack application with React frontend and Golang backend, featuring CI/CD pipelines and cloud deployment.

## Architecture

- **Frontend**: React application served via S3 and CloudFront
- **Backend**: Golang API running on EC2 with Auto Scaling
- **Database**: MongoDB Atlas
- **Cache**: Redis ElastiCache
- **Infrastructure**: Terraform-managed AWS resources

## Project Structure

```
starttech-application/
├── .github/
│   └── workflows/
│       ├── frontend-ci-cd.yml
│       └── backend-ci-cd.yml
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── Dockerfile
├── backend/
│   ├── main.go
│   ├── go.mod
│   └── Dockerfile
└── scripts/
    ├── deploy-frontend.sh
    ├── deploy-backend.sh
    ├── health-check.sh
    └── rollback.sh
```

## Prerequisites

- Node.js 18+
- Go 1.21+
- AWS CLI configured
- GitHub repository access

## Local Development

### Frontend
```bash
cd frontend
npm install
npm start
```

### Backend
```bash
cd backend
go mod download
go run main.go
```

## CI/CD Pipelines

### Frontend Pipeline
- **Trigger**: Push/PR to `main` branch affecting `frontend/` directory
- **Stages**:
  - Install dependencies
  - Run tests and linting
  - Security audit
  - Build production bundle
  - Deploy to S3
  - Invalidate CloudFront cache

### Backend Pipeline
- **Trigger**: Push/PR to `main` branch affecting `backend/` directory
- **Stages**:
  - Run tests and vetting
  - Build Docker image
  - Push to ECR
  - Deploy to EC2

## Deployment

### Manual Deployment
```bash
# Frontend
./scripts/deploy-frontend.sh

# Backend
./scripts/deploy-backend.sh
```

### Health Checks
```bash
./scripts/health-check.sh
```

### Rollback
```bash
./scripts/rollback.sh
```

## Environment Variables

### Frontend
- `REACT_APP_API_URL`: Backend API URL

### Backend
- `PORT`: Server port (default: 8080)
- `MONGODB_URI`: MongoDB connection string
- `REDIS_URL`: Redis connection URL

## Security

- Secrets managed via GitHub Secrets
- AWS IAM with least-privilege access
- Security scanning in CI/CD pipelines
- HTTPS enforced via CloudFront

## Monitoring

- CloudWatch Logs for application logs
- CloudWatch Metrics for infrastructure monitoring
- Health checks via ALB

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes and test locally
4. Push to your fork
5. Create a Pull Request

## License

This project is licensed under the MIT License.