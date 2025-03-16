#!/bin/bash

# Atualiza os pacotes existentes
sudo apt update || { echo "Falha ao atualizar pacotes"; exit 1; }

# Instala dependências necessárias
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common || { echo "Falha ao instalar dependências"; exit 1; }

# Adiciona a chave GPG oficial do Docker (usando o método moderno)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg || { echo "Falha ao adicionar chave GPG"; exit 1; }

# Adiciona o repositório Docker às fontes APT
UBUNTU_VERSION=$(lsb_release -cs)
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $UBUNTU_VERSION stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { echo "Falha ao adicionar repositório Docker"; exit 1; }

# Atualiza o banco de dados de pacotes com os pacotes Docker
sudo apt update || { echo "Falha ao atualizar pacotes Docker"; exit 1; }

# Verifica se a instalação será do repositório Docker
sudo apt-cache policy docker-ce

# Instala o Docker
sudo apt install -y docker-ce || { echo "Falha ao instalar Docker"; exit 1; }

# Verifica se o Docker está funcionando
sudo systemctl status docker

# Adiciona o usuário atual ao grupo docker
sudo usermod -aG docker ${USER} || { echo "Falha ao adicionar usuário ao grupo docker"; exit 1; }

echo "Docker instalado com sucesso!"
