#!/bin/bash

# Atualiza o sistema
sudo apt update && sudo apt upgrade -y

# Cria pastas padrão no /home
mkdir -p ~/Desktop ~/Downloads ~/Imagens ~/Vídeos ~/Documentos ~/Música

# Instala pacotes essenciais
sudo apt install -y xorg xinit i3-wm i3status i3blocks dmenu rofi picom feh lxappearance \
    lightdm firefox-esr thunar xfce4-terminal pavucontrol xfce4-power-manager \
    pulseaudio bluez blueman alsa-utils vlc mpv ffmpeg tumbler evince file-roller unzip rar p7zip-full \
    ntfs-3g exfat-fuse exfatprogs ufw numlockx scrot xclip neofetch htop nano

# Ativa o firewall UFW
sudo ufw enable

# Configuração do i3wm
mkdir -p ~/.config/i3
cat <<EOL > ~/.config/i3/config
# Tecla Mod (Super/Windows)
set \$mod Mod4

# Atalhos básicos
bindsym \$mod+Return exec xfce4-terminal  # Abrir terminal
bindsym \$mod+d exec rofi -show drun      # Abrir menu de aplicativos
bindsym \$mod+Shift+e exec "i3-msg exit"  # Sair do i3wm
bindsym \$mod+Shift+q kill                # Fechar janela
bindsym \$mod+Shift+r restart             # Reiniciar i3wm
bindsym \$mod+Shift+x exec "poweroff"     # Desligar o sistema
bindsym \$mod+Shift+b exec "reboot"       # Reiniciar o sistema

# Movimentação entre janelas
bindsym \$mod+h focus left
bindsym \$mod+l focus right
bindsym \$mod+j focus down
bindsym \$mod+k focus up

# Alternar janela flutuante
bindsym \$mod+Shift+space floating toggle

# Controle de volume
bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume @DEFAULT_SINK@ +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume @DEFAULT_SINK@ -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute @DEFAULT_SINK@ toggle"

# Barra de status
bar {
    status_command i3blocks
    position top
    font pango:Monospace 10
}

# Papel de parede e programas iniciais
exec --no-startup-id feh --bg-scale ~/Imagens/wallpaper.jpg
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
exec --no-startup-id xfce4-power-manager
exec --no-startup-id picom --config ~/.config/picom.conf
EOL

# Configuração do i3blocks (barra de status)
mkdir -p ~/.config/i3blocks
cat <<EOL > ~/.config/i3blocks/config
[time]
command=date '+%H:%M | %d/%m/%Y'
interval=60

[volume]
command=pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print "🔊 " \$5}'
interval=5

[network]
command=nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2
interval=10
EOL

# Baixa um papel de parede padrão
mkdir -p ~/Imagens
wget -O ~/Imagens/wallpaper.jpg https://source.unsplash.com/random/1920x1080

# Mensagem final
echo "✅ Instalação concluída! Reinicie o sistema e inicie a sessão i3wm."
