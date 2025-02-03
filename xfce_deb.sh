#!/usr/bin/env bash

#========================================================================================================================================================================================================
PESSOA=$(whoami)

# Função para garantir que o script seja executado com permissões de root
ensure_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script deve ser executado com permissões de root. Usando sudo..."
        sudo "$0" "$@"
        exit $?
    fi
}

# Chama a função de verificação de root
ensure_root "$@"

# Função para verificar erros
check_error() {
    if [ $? -ne 0 ]; then
        echo "Erro: $1"
        exit 1
    fi
}

# Configurando a sources.list do Debian para incluir non-free e non-free-firmware
echo -e "-------------- Configurando a sources.list do Debian ---------------------\n"
sleep 2s

# Backup do sources.list original
if [ -f /etc/apt/sources.list ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    check_error "Falha ao fazer backup do sources.list."
fi

# Configuração do sources.list para Debian Bookworm
echo "# Bookworm (non-free)
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb https://security.debian.org/ bookworm-security main contrib non-free non-free-firmware
" | sudo tee /etc/apt/sources.list > /dev/null
check_error "Falha ao configurar o sources.list."

echo -e "Configuração do sources.list concluída.\n"

# Atualizando o sistema
echo -e "  ---------> Atualizando o sistema <------------ \n"
sleep 2s
sudo apt update && sudo apt upgrade -y
check_error "Falha ao atualizar o sistema."
echo -e "Sistema atualizado.\n"

# Atualizando o sistema completamente
echo -e "------------> Realizando full-upgrade <------------------\n"
sleep 2s
sudo apt full-upgrade -y
check_error "Falha ao realizar o full-upgrade."
echo -e "Upgrade completo realizado.\n"

# Limpando pacotes antigos e desnecessários (sem remover pacotes úteis)
echo -e "---------> Comando autoremove <---------\n"
sleep 2s
sudo apt clean && sudo apt autoclean
check_error "Falha ao limpar pacotes antigos."
echo -e "Limpeza concluída.\n"

# Ambiente Xfce4
echo -e "-------------> Instalando Xfce4 <-------------\n"
sleep 2s
sudo apt install -y \
    xorg \
    xfwm4 \
    lightdm \
    lightdm-gtk-greeter \
    xfce4-datetime-plugin \
    xfce4-genmon-plugin \
    xfce4-notifyd \
    xfce4-panel \
    xfce4-power-manager \
    xfce4-pulseaudio-plugin \
    xfce4-screenshooter \
    xfce4-session \
    xfce4-settings \
    xfce4-taskmanager \
    xfce4-terminal \
    xfce4-whiskermenu-plugin \
    pulseaudio \
    pavucontrol \
    policykit-1-gnome \
    mugshot
check_error "Falha ao instalar o ambiente Xfce4."
echo -e "Xfce4 e ferramentas essenciais instalados.\n"

# Gerenciamento de arquivos
echo -e "-------------> Instalando ferramentas de gerenciamento de arquivos <-------------\n"
sleep 2s
sudo apt install -y \
    thunar \
    gvfs-backends \
    gvfs-fuse \
    p7zip-full
check_error "Falha ao instalar ferramentas de gerenciamento de arquivos."
echo -e "Ferramentas de gerenciamento de arquivos instaladas.\n"

# Gerenciamento de redes
echo -e "-------------> Instalando gerenciamento de redes <-------------\n"
sleep 2s
sudo apt install -y \
    network-manager \
    network-manager-gnome
check_error "Falha ao instalar gerenciamento de redes."
echo -e "Gerenciamento de redes instalado.\n"

# Editores de texto
echo -e "-------------> Instalando editores de texto <-------------\n"
sleep 2s
sudo apt install -y \
    geany \
    geany-plugins \
    vim \
    nano
check_error "Falha ao instalar editores de texto."
echo -e "Editores de texto instalados.\n"

# Correção ortográfica
echo -e "-------------> Instalando correção ortográfica <-------------\n"
sleep 2s
sudo apt install -y \
    aspell \
    aspell-pt-br
check_error "Falha ao instalar correção ortográfica."
echo -e "Correção ortográfica instalada.\n"

# Aparência
echo -e "-------------> Instalando temas e ícones <-------------\n"
sleep 2s
sudo apt install -y \
    lxappearance \
    numix-gtk-theme \
    numix-icon-theme \
    numix-icon-theme-circle \
    papirus-icon-theme \
    arc-theme \
    breeze-cursor-theme \
    fonts-font-awesome
check_error "Falha ao instalar temas e ícones."
echo -e "Temas e ícones instalados.\n"

# Informações do sistema
echo -e "-------------> Instalando ferramentas de informações do sistema <-------------\n"
sleep 2s
sudo apt install -y \
    htop \
    neofetch
check_error "Falha ao instalar ferramentas de informações do sistema."
echo -e "Ferramentas de informações do sistema instaladas.\n"

# Gerenciamento da tela de login
echo -e "-------------> Instalando gerenciamento da tela de login <-------------\n"
sleep 2s
sudo apt install -y \
    lightdm-gtk-greeter-settings
check_error "Falha ao instalar gerenciamento da tela de login."
echo -e "Gerenciamento da tela de login instalado.\n"

# Bluetooth
echo -e "-------------> Instalando Bluetooth <-------------\n"
sleep 2s
sudo apt install -y \
    blueman \
    bluez
check_error "Falha ao instalar Bluetooth."
echo -e "Bluetooth instalado.\n"

# Gerenciamento de discos
echo -e "-------------> Instalando Gerenciamento de discos <-------------\n"
sleep 2s
sudo apt install -y \
    gparted
check_error "Falha ao instalar Gerenciamento de discos."
echo -e "Gerenciamento de discos instalado.\n"

# Navegadores
echo -e "-------------> Instalando Navegadores <-------------\n"
sleep 2s
sudo apt install -y \
    firefox-esr \
    firefox-esr-l10n-pt-br
check_error "Falha ao instalar Navegadores."
echo -e "Navegadores instalados.\n"

# Torrent
echo -e "-------------> Instalando Transmission (Torrent) <-------------\n"
sleep 2s
sudo apt install -y \
    transmission
check_error "Falha ao instalar Transmission."
echo -e "Transmission instalado.\n"

# Download de vídeos
echo -e "-------------> Instalando Youtube-DL <-------------\n"
sleep 2s
sudo apt install -y \
    youtube-dl
check_error "Falha ao instalar Youtube-DL."
echo -e "Youtube-DL instalado.\n"

# SMPlayer
echo -e "-------------> Instalando SMPlayer <-------------\n"
sleep 2s
sudo apt install -y \
    smplayer \
    smplayer-l10n \
    smplayer-themes
check_error "Falha ao instalar SMPlayer."
echo -e "SMPlayer instalado.\n"

# VLC
echo -e "-------------> Instalando VLC <-------------\n"
sleep 2s
sudo apt install -y \
    vlc \
    vlc-l10n
check_error "Falha ao instalar VLC."
echo -e "VLC instalado.\n"

# Editor de áudio
echo -e "-------------> Instalando Audacity <-------------\n"
sleep 2s
sudo apt install -y \
    audacity
check_error "Falha ao instalar Audacity."
echo -e "Audacity instalado.\n"

# Suíte LibreOffice
echo -e "-------------> Instalando LibreOffice <-------------\n"
sleep 2s
sudo apt install -y \
    libreoffice \
    libreoffice-l10n-pt-br \
    libreoffice-gnome \
    libreoffice-style-breeze
check_error "Falha ao instalar LibreOffice."
echo -e "LibreOffice instalado.\n"

# Leitor de PDF
echo -e "-------------> Instalando Atril (Leitor de PDF) <-------------\n"
sleep 2s
sudo apt install -y \
    atril
check_error "Falha ao instalar Atril."
echo -e "Atril instalado.\n"

# Calculadora
echo -e "-------------> Instalando Calculadora <-------------\n"
sleep 2s
sudo apt install -y \
    gnome-calculator
check_error "Falha ao instalar Calculadora."
echo -e "Calculadora instalada.\n"

# Editor de imagens
echo -e "-------------> Instalando GIMP <-------------\n"
sleep 2s
sudo apt install -y \
    gimp
check_error "Falha ao instalar GIMP."
echo -e "GIMP instalado.\n"

# Visualizadores de imagens
echo -e "-------------> Instalando Visualizadores de imagens <-------------\n"
sleep 2s
sudo apt install -y \
    sxiv
check_error "Falha ao instalar Visualizadores de imagens."
echo -e "Visualizadores de imagens instalados.\n"

# Captura de tela
echo -e "-------------> Instalando Xfce4 Screenshooter <-------------\n"
sleep 2s
sudo apt install -y \
    xfce4-screenshooter
check_error "Falha ao instalar Xfce4 Screenshooter."
echo -e "Xfce4 Screenshooter instalado.\n"

# Jogos (Paciência)
echo -e "-------------> Instalando Aisleriot (Paciência) <-------------\n"
sleep 2s
sudo apt install -y \
    aisleriot
check_error "Falha ao instalar Aisleriot."
echo -e "Aisleriot instalado.\n"

# XDG (User Dirs)
echo -e "-------------> Configurando pastas do usuário <-------------\n"
sleep 2s
sudo apt install -y \
    xdg-user-dirs \
    xdg-utils
check_error "Falha ao instalar XDG User Dirs."
xdg-user-dirs-update
check_error "Falha ao configurar pastas do usuário."
echo -e "Pastas do usuário configuradas.\n"

# Flatpak
echo -e "-------------> Instalando Flatpak <-------------\n"
sleep 2s
sudo apt install -y \
    flatpak \
    gnome-software-plugin-flatpak \
    gnome-software
check_error "Falha ao instalar Flatpak."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
check_error "Falha ao adicionar repositório Flathub."
echo -e "Flatpak instalado e configurado.\n"

# Atualizando o firmware do processador
echo -e "-------------> Atualizando o firmware do processador <-------------\n"
sleep 2s
if lscpu | grep -i intel > /dev/null; then
    sudo apt install -y intel-microcode
elif lscpu | grep -i amd > /dev/null; then
    sudo apt install -y amd64-microcode
fi
check_error "Falha ao instalar o firmware do processador."
echo -e "Firmware do processador atualizado.\n"

# Alterando o valor da swappiness para melhorar a performance
echo -e "-------------> Alterando o valor da swappiness <-------------\n"
sleep 2s
echo "vm.swappiness=5" | sudo tee -a /etc/sysctl.conf > /dev/null
check_error "Falha ao alterar o valor da swappiness."
sudo sysctl -p
check_error "Falha ao aplicar a alteração da swappiness."
echo -e "Swappiness alterado para 5.\n"

# Finalizando
echo -e "---------> Configuração concluída <---------\n"
sleep 1s
echo -e "Sistema pronto para uso!\n"

# Bem-vindo ao Debian
echo -e "Bem-vindo ao Debian, $PESSOA!\n"
echo -e "O Debian é uma das distribuições Linux mais confiáveis e estáveis. Agora, seu sistema está otimizado e pronto para uso!\n"

sleep 3s
