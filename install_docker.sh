#!/bin/bash
set -e

echo "=== Atualizando pacotes ==="
sudo apt-get update -y || sudo yum update -y

echo "=== Instalando Docker ==="
if [ -f /etc/lsb-release ]; then
    # Ubuntu
    sudo apt-get install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    # Amazon Linux 2
    sudo amazon-linux-extras install docker -y || sudo dnf install docker -y
fi

echo "=== Habilitando e iniciando o Docker ==="
sudo systemctl enable docker
sudo systemctl start docker

echo "=== Adicionando o usuário atual ao grupo docker ==="
sudo usermod -aG docker $USER

echo "=== Instalando Docker Compose (standalone, caso o plugin não exista) ==="
if ! command -v docker-compose &> /dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

echo "=== Verificando instalação ==="
docker --version
docker compose version || docker-compose --version