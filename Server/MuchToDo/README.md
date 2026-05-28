# MuchToDo - Container Assessment

A containerized Golang backend API with MongoDB, deployed using Docker and Kubernetes.

## Prerequisites
- Docker and Docker Compose
- Kind (Kubernetes in Docker)
- kubectl

## Project Structure

- Dockerfile - multi-stage Docker build
- docker-compose.yaml - local development setup
- .dockerignore - files excluded from Docker build
- kubernetes/namespace.yaml - Kubernetes namespace
- kubernetes/mongodb/ - MongoDB deployment manifests
- kubernetes/backend/ - Backend deployment manifests
- kubernetes/ingress.yaml - Ingress configuration
- scripts/docker-build.sh - builds the Docker image
- scripts/docker-run.sh - runs with docker compose
- scripts/k8s-deploy.sh - deploys to Kubernetes
- scripts/k8s-cleanup.sh - cleans up Kubernetes resources

## Phase 1: Docker Setup

### Build the image
```bash
./scripts/docker-build.sh
```

### Run with Docker Compose
```bash
./scripts/docker-run.sh
```

### Verify
```bash
docker compose ps
curl http://localhost:8080/health
```

## Phase 2: Kubernetes Setup

### Create Kind cluster
```bash
kind create cluster --name muchtodo-cluster
```

### Load image into cluster
```bash
kind load docker-image muchtodo-backend:latest --name muchtodo-cluster
```

### Deploy to Kubernetes
```bash
./scripts/k8s-deploy.sh
```

### Verify
```bash
kubectl get all -n muchtodo
curl http://172.19.0.2:30080/health
```

### Cleanup
```bash
./scripts/k8s-cleanup.sh
```

## Application Endpoints
- GET /health - Health check returns database and cache status
- GET /ping - Simple ping returns pong
- GET /swagger/index.html - API documentation