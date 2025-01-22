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

# Instalar pacotes essenciais organizados por categorias
instalar_pacotes() {
    echo -e "\nInstalando pacotes essenciais e categorizados...\n"

    # Pacotes para o ambiente gráfico XFCE e interface
    echo -e "Instalando pacotes para ambiente gráfico XFCE e interface..."
    sudo apt install -y xorg xfce4 xfce4-plugins xfce4-terminal xfce4-datetime-plugin xfce4-goodies \
        xfce4-genmon-plugin xfce4-notifyd xfce4-panel xfce4-pulseaudio-plugin xfce4-session \
        xfce4-settings xfce4-taskmanager xfce4-whiskermenu-plugin xfce4-screenshooter numlockx \
        lightdm lightdm-gtk-greeter
    echo "Pacotes para ambiente gráfico XFCE instalados!\n"

    # Pacotes de multimídia (áudio e vídeo)
    echo -e "Instalando pacotes para multimídia..."
    sudo apt install -y pulseaudio pavucontrol vlc vlc-l10n smplayer smplayer-l10n smplayer-themes \
        audacity youtube-dl
    echo "Pacotes para multimídia instalados!\n"

    # Pacotes de escritório
    echo -e "Instalando pacotes de escritório..."
    sudo apt install -y libreoffice libreoffice-l10n-pt-br libreoffice-gnome libreoffice-style-breeze
    echo "Pacotes de escritório instalados!\n"

    # Pacotes para PDFs
    echo -e "Instalando pacotes para manipulação de PDFs..."
    sudo apt install -y atril poppler-utils
    echo "Pacotes para PDFs instalados!\n"

    # Pacotes para redes e conectividade
    echo -e "Instalando pacotes para redes e conectividade..."
    sudo apt install -y network-manager network-manager-gnome blueman bluez gufw
    echo "Pacotes para redes instalados!\n"

    # Temas e personalização
    echo -e "Instalando temas e pacotes de personalização..."
    sudo apt install -y arc-theme papirus-icon-theme breeze-cursor-theme mugshot lightdm-gtk-greeter-settings
    echo "Temas e pacotes de personalização instalados!\n"

    # Utilitários e ferramentas do sistema
    echo -e "Instalando utilitários e ferramentas do sistema..."
    sudo apt install -y gparted bash-completion vim geany geany-plugins htop neofetch fzf xdg-user-dirs \
        xdg-utils gnome-calculator aisleriot p7zip-full rar unrar
    echo "Utilitários instalados!\n"

    # Atualizar o firmware do processador
    echo -e "Atualizando o firmware do processador..."
    sudo apt install -y intel-microcode
    # Se você tiver processador AMD, descomente a linha abaixo:
    # sudo apt install -y amd64-microcode
    echo "Firmware atualizado!\n"
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
