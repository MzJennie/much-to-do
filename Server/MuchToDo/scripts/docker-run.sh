#!/bin/bash
echo "Starting services with docker compose..."
docker compose up -d
docker compose ps
