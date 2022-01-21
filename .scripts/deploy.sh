#!/bin/bash
set -e

echo "Deployment started ..."

# Pull the latest version of the app
git pull origin develop

ruby data_train.rb

echo "Deployment finished!"