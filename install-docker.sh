#!/bin/bash

# English: Update existing packages
# Português: Atualize os pacotes existentes
sudo apt update

# English: Install some necessary dependencies
# Português: Instale algumas dependências necessárias
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# English: Add the official Docker GPG key
# Português: Adicione a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# English: Add the Docker repository to APT sources
# Português: Adicione o repositório Docker às fontes APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# English: Update the package database with Docker packages from the newly added repository
# Português: Atualize o banco de dados de pacotes com os pacotes Docker a partir do repositório recém adicionado
sudo apt update

# English: Make sure you are about to install from the Docker repository instead of the default Ubuntu repository
# Português: Certifique-se de que você está prestes a instalar a partir do repositório Docker em vez do repositório padrão do Ubuntu
sudo apt-cache policy docker-ce

# English: Install Docker
# Português: Instale o Docker
sudo apt install -y docker-ce

# English: Check if Docker is working
# Português: Verifique se o Docker está funcionando
sudo systemctl status docker


# English: Adding the current user to the docker group so they can run docker commands without sudo
# Português: Adicionando o usuário atual ao grupo docker para que ele possa executar comandos docker sem sudo
sudo usermod -aG docker ${USER}

