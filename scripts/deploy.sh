#!/bin/bash

# deploy.sh - Script to deploy Spotify playlists using Terraform

# Check for errors and exit if any command fails
set -e

# Function to print messages
print_message() {
    echo "==============================="
    echo "$1"
    echo "==============================="
}

# Start the deployment
print_message "Starting Terraform Deployment for Spotify Playlists"

# Navigate to the Terraform directory
cd terraform

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
else
    print_message "Error: .env file not found!"
    exit 1
fi

# Initialize Terraform
print_message "Initializing Terraform..."
terraform init

# Apply the Terraform configuration
print_message "Applying Terraform Configuration..."
terraform apply -auto-approve

# Completion message
print_message "Deployment Completed Successfully!"
