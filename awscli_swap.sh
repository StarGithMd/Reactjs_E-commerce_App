# Create 2GB Swap to prevent t2.micro freezing during React build/Jenkins
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Update package list
sudo apt update

# Install required packages
sudo apt install -y curl unzip

# Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extract package
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Check server if installed successfull AWS CLI
aws --version

