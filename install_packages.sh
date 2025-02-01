#!/bin/bash

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo apt install -y xorg xinit i3-wm i3status i3blocks dmenu rofi picom feh lxappearance \
    lightdm firefox-esr thunar xfce4-terminal pavucontrol xfce4-power-manager \
    pulseaudio bluez blueman alsa-utils vlc mpv ffmpeg tumbler evince file-roller p7zip-full \
    ntfs-3g exfat-fuse exfatprogs numlockx scrot xclip neofetch htop nano \
    lightdm-gtk-greeter rofi p7zip-full xfce4-notifyd lxappearance numix-gtk-theme \
    numix-icon-theme numix-icon-theme-circle papirus-icon-theme arc-theme breeze-cursor-theme \
    fonts-font-awesome nitrogen network-manager network-manager-gnome pulseaudio pavucontrol \
    xfce4-screenshooter sxiv xfce4-power-manager numlockx geany geany-plugins vim wmctrl \
    xdotool xinput lxinput policykit-1-gnome blueman transmission vlc vlc-l10n audacity \
    smplayer smplayer-l10n smplayer-themes atril gnome-calculator xfce4-screenshooter bluez blueman

# Mensagem final
echo "✅ Instalação concluída!"
