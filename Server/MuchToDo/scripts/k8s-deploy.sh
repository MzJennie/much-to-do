#!/bin/bash
echo "Loading image into Kind cluster..."
kind load docker-image muchtodo-backend:latest --name muchtodo-cluster

echo "Deploying to Kubernetes..."
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/mongodb/
kubectl apply -f kubernetes/backend/
kubectl apply -f kubernetes/ingress.yaml

echo "Waiting for pods to be ready..."
kubectl wait --for=condition=ready pod -l app=backend -n muchtodo --timeout=120s
kubectl wait --for=condition=ready pod -l app=mongodb -n muchtodo --timeout=120s

echo "Deployment complete. Checking status..."
kubectl get all -n muchtodo
