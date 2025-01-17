#!/usr/bin/env bash

#====================================================================
# Script de pós-instalação do Debian Minimal com XFCE
# Autor: Cláudio
#====================================================================

PESSOA=$(whoami)

# Função para garantir permissões de root
ensure_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script precisa ser executado como root. Usando sudo..."
        sudo "$0" "$@"
        exit 1
    fi
}

# Configurar a sources.list
config_sources_list() {
    echo -e "\nConfigurando sources.list com non-free e non-free-firmware..."
    echo "#Bookworm (non-free)
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb https://security.debian.org/ bookworm-security main contrib non-free non-free-firmware
" | sudo tee /etc/apt/sources.list
    echo "Sources.list configurado com sucesso!"
}

# Atualizar e limpar o sistema
atualizar_sistema() {
    echo -e "\nAtualizando o sistema..."
    sudo apt update && sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
    echo "Atualização e limpeza concluídas!"
}

# Instalar pacotes essenciais
instalar_pacotes() {
    echo -e "\nInstalando pacotes essenciais e XFCE..."
    sudo apt install -y xorg xfce4 xfce4-plugins xfce4-terminal \
        mousepad network-manager bash-completion vim neofetch \
        bluez blueman evince vlc audacious gparted gdebi flatpak \
        arc-theme papirus-icon-theme breeze-cursor-theme
    echo "Pacotes essenciais instalados!"
}

# Configurar o Flatpak e Flathub
configurar_flatpak() {
    echo -e "\nConfigurando Flatpak..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "Flatpak configurado!"
}

# Melhorar desempenho com swappiness
configurar_swappiness() {
    echo -e "\nConfigurando swappiness..."
    echo "vm.swappiness=5" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    echo "Swappiness configurado!"
}

# Finalização
finalizar() {
    echo -e "\nConfiguração concluída! Sistema pronto para uso!"
    echo "Bem-vindo ao Debian, $PESSOA!"
    echo "Reinicie o sistema para aplicar todas as mudanças."
}

# Execução do script
ensure_root "$@"
config_sources_list
atualizar_sistema
instalar_pacotes
configurar_flatpak
configurar_swappiness
finalizar
