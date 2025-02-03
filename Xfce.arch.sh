#!/usr/bin/env bash

#======================================================================
# Script de instalação do Xfce no Arch Linux
#======================================================================

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script deve ser executado como root. Use sudo!"
    exit 1
fi

# Atualizando o sistema
echo "Atualizando o sistema..."
pacman -Syu --noconfirm

# Instalando pacotes essenciais para o ambiente gráfico Xfce
echo "Instalando o ambiente Xfce..."
pacman -S --noconfirm xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
systemctl enable lightdm

# Gerenciamento de arquivos
echo "Instalando ferramentas de gerenciamento de arquivos..."
pacman -S --noconfirm thunar gvfs gvfs-mtp ntfs-3g exfat-utils p7zip

# Gerenciamento de redes
echo "Instalando ferramentas de rede..."
pacman -S --noconfirm networkmanager network-manager-applet
systemctl enable NetworkManager

# Editores
echo "Instalando editores de texto..."
pacman -S --noconfirm geany nano vim

# Aparência
echo "Instalando temas e ícones..."
pacman -S --noconfirm lxappearance arc-gtk-theme papirus-icon-theme

# Informações do sistema
echo "Instalando ferramentas de monitoramento..."
pacman -S --noconfirm htop neofetch

# Gerenciamento da tela de login
echo "Instalando configurações para LightDM..."
pacman -S --noconfirm lightdm-gtk-greeter-settings

# Bluetooth
echo "Instalando suporte a Bluetooth..."
pacman -S --noconfirm bluez bluez-utils blueman
systemctl enable bluetooth

# Gerenciamento de discos
echo "Instalando ferramentas de gerenciamento de disco..."
pacman -S --noconfirm gparted

# Navegadores
echo "Instalando navegadores..."
pacman -S --noconfirm firefox

# Clientes Torrent
echo "Instalando cliente Torrent..."
pacman -S --noconfirm transmission-gtk

# Reprodutores de mídia
echo "Instalando reprodutores de mídia..."
pacman -S --noconfirm smplayer vlc

# Editor de áudio
echo "Instalando editor de áudio..."
pacman -S --noconfirm audacity

# Suite LibreOffice
echo "Instalando LibreOffice..."
pacman -S --noconfirm libreoffice-fresh libreoffice-fresh-pt-br

# Leitor de PDF
echo "Instalando leitor de PDF..."
pacman -S --noconfirm atril

# Calculadora
echo "Instalando calculadora..."
pacman -S --noconfirm gnome-calculator

# Editor de imagens
echo "Instalando GIMP..."
pacman -S --noconfirm gimp

# Visualizadores de imagens
echo "Instalando visualizador de imagens..."
pacman -S --noconfirm sxiv

# Captura de tela
echo "Instalando ferramenta de captura de tela..."
pacman -S --noconfirm xfce4-screenshooter

# Jogos básicos
echo "Instalando jogo de Paciência..."
pacman -S --noconfirm aisleriot

# XDG - Pastas padrão do usuário
echo "Criando pastas padrão do usuário..."
pacman -S --noconfirm xdg-user-dirs xdg-utils
xdg-user-dirs-update

# Instalando Yay (AUR Helper)
echo "Instalando Yay..."
pacman -S --needed --noconfirm git base-devel
sudo -u $(logname) git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
cd /tmp/yay-bin
sudo -u $(logname) makepkg -si --noconfirm
cd ~
rm -rf /tmp/yay-bin

# Ativando o Firewall
ufw enable

# Atualizando o sistema novamente
echo "Realizando última atualização..."
pacman -Syu --noconfirm

# Finalizando
echo "Configuração concluída! O sistema está pronto para uso."
