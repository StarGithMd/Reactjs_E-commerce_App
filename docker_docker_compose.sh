# install docker and docker compose plugin
#!/bin/bash

set -e

echo "======================================"
echo "Installing Docker Engine"
echo "Installing Docker Compose Plugin"
echo "Ubuntu 26.04"
echo "======================================"

# Update packages
sudo apt update -y

# Remove old Docker packages if they exist
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
do
    sudo apt remove -y  >/dev/null 2>&1 || true
done

# Install prerequisites
sudo apt install -y ca-certificates curl gnupg

# Add Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo "deb [arch=] https://download.docker.com/linux/ubuntu resolute stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index
sudo apt update -y

# Install Docker Engine and Compose Plugin
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable Docker Service
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to docker group
sudo usermod -aG docker ubuntu

echo ""
echo "======================================"
echo "Docker Installation Complete"
echo "======================================"

docker --version
docker compose version

echo ""
echo "Docker Service Status:"
sudo systemctl is-active docker

echo ""
echo "Logout and login again"
echo "======================================"

