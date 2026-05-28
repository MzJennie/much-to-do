#!/bin/bash
echo "Cleaning up Kubernetes resources..."
kubectl delete namespace muchtodo
kind delete cluster --name muchtodo-cluster
echo "Cleanup complete."
