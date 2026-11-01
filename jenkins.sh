sudo apt update && sudo apt upgrade -y
sudo apt install -y fontconfig openjdk-21-jre

java -version

sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt install -y jenkins

# Check the jenkins status
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Add jenkins user to the docker group so Jenkins can build & deploy containers
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

sudo systemctl status jenkins

