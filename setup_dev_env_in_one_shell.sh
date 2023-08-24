# update
apt-get update -y
apt-get upgrade -y

# libs
apt-get install vim -y
apt-get remove nano -y
apt-get install curl -y
apt-get install  iputils-ping net-tools -y
apt-get install sshpass -y
apt-get install zip unzip -y
sudo apt-get install git -y
apt-get install openssh-server -y
apt-get install jq -y

# zsh and oh-my-zsh
apt-get install zsh -y
chsh -s $(which zsh)
zsh --version

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# sdkman
curl -s "https://get.sdkman.io" | bash
sdk install java 8.0.382-amzn
sdk install java 11.0.20-amzn
sdk install java 17.0.8-amzn
sdk install gradle 8.2.1  
sdk install maven 3.9.4
sdk install scala 3.3.0

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v16
npm install --global yarn

# anaconda
apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh # get version from https://repo.anaconda.com/archive/
sh Anaconda3-2022.05-Linux-x86_64.sh
conda create -n mypython python=3.10.3

# docker
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
systemctl start docker
docker version

systemctl daemon-reload
systemctl restart docker.service
systemctl enable docker.service

sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
systemctl restart docker
docker ps

# apps
snap install --classic code
snap install chromium
snap install firefox
snap install pycharm-community 
snap install intellij-idea-community

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    tee /etc/apt/sources.list.d/azure-cli.list

apt-get update
apt-get install azure-cli
