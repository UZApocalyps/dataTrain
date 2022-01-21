#!/bin/bash
set -e

echo "Deployment started ..."

# Pull the latest version of the app
git pull origin develop

sudo systemctl start datatrain.service

echo "Deployment finished!"