

echo "Deployment started ..."

# Pull the latest version of the app
git pull

sudo systemctl restart datatrain.service

echo "Deployment finished!"