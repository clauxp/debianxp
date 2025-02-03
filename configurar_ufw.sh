#!/bin/bash

echo "Configuração de UFW para usuário doméstico"

# Ativar o firewall
sudo ufw enable

# Definir política padrão: bloquear conexões de entrada e permitir saída
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir conexões da rede local
sudo ufw allow from 192.168.0.0/16

# Bloquear porta SSH padrão (22) para conexões externas
sudo ufw deny 22
sudo ufw deny 22/tcp
sudo ufw deny 22/udp

# Exibir status final
echo -e "\nConfiguração final do UFW:"
sudo ufw status verbose
echo "Configuração concluída!"
