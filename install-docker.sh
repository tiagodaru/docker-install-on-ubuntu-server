#!/bin/bash

# Atualize os pacotes existentes
sudo apt update

# Instale algumas dependências necessárias
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adicione a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicione o repositório Docker às fontes APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualize o banco de dados de pacotes com os pacotes Docker a partir do repositório recém adicionado
sudo apt update

# Certifique-se de que você está prestes a instalar a partir do repositório Docker em vez do repositório padrão do Ubuntu
sudo apt-cache policy docker-ce

# Instale o Docker
sudo apt install -y docker-ce

# Verifique se o Docker está funcionando
sudo systemctl status docker
