

echo "Deployment started ..."

# Pull the latest version of the app
git checkout develop
git pull origin develop

sudo systemctl restart datatrain.service

echo "Deployment finished!"