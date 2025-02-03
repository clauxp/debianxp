#!/bin/bash

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo pacman -Syu --noconfirm

# Instala pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo pacman -S --noconfirm xorg xorg-xinit i3-wm i3status dmenu rofi picom feh lxappearance \
    lightdm lightdm-gtk-greeter firefox thunar xfce4-terminal pipewire pipewire-pulse wireplumber \
    bluez bluez-utils blueman alsa-utils vlc mpv ffmpeg tumbler evince file-roller p7zip \
    ntfs-3g exfat-utils numlockx scrot xclip neofetch htop nano xfce4-notifyd nitrogen \
    network-manager-applet networkmanager xfce4-screenshooter sxiv geany geany-plugins vim wmctrl \
    xdotool xinput lxinput polkit-gnome transmission-gtk audacity smplayer smplayer-skins \
    gnome-calculator

# Habilita serviços essenciais
echo "Ativando serviços essenciais..."
sudo systemctl enable lightdm NetworkManager bluetooth

# Mensagem final
echo "✅ Instalação concluída!"
