#!/usr/bin/env bash

#========================================================================================================================================================================================================
PESSOA=$(whoami)

# Função para garantir que o script seja executado com permissões de root
ensure_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script deve ser executado com permissões de root. Usando sudo..."
        sudo "$0" "$@"
        exit 1
    fi
}

# Chama a função de verificação de root
ensure_root "$@"

#  Configurando a sources.list do Debian para incluir non-free e non-free-firmware
echo -e "-------------- Configurando a sources.list do Debian ---------------------\n"
sleep 2s
echo "#Bookworm (non-free)

deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb http://security.debian.org/ bookworm-security main contrib non-free non-free-firmware
" | sudo tee /etc/apt/sources.list

echo -e "Configuração do sources.list concluída.\n"

# Atualizando o sistema
echo -e "  ---------> Atualizando o sistema <------------ \n"
sleep 2s
sudo apt update && sudo apt upgrade -y
sleep 1s
echo -e "Sistema atualizado.\n"

# Atualizando o sistema completamente
echo -e "------------> Realizando full-upgrade <------------------\n"
sleep 2s
sudo apt full-upgrade -y
sleep 1s
echo -e "Upgrade completo realizado.\n"

# Limpando pacotes antigos e desnecessários
echo -e "---------> Comando autoremove <---------\n"
sleep 2s
sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sleep 1s
echo -e "Limpeza concluída.\n"

# Ambiente Xfce4
echo -e "-------------> Xfce4 <-------------\n"
sleep 2s
sudo apt install -y xorg \
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

sleep 1s
echo -e "Ferramentas essenciais instaladas.\n"

# ## Gerenciamento de arquivos...
echo -e "------------->  Gerenciamento de arquivos <-------------\n"
sleep 2s
sudo apt install -y thunar \
gvfs-backends \
gvfs-fuse \
p7zip-full

sleep 1s
echo -e "Ferramentas de mídia instaladas.\n"

# Gerenciamento de redes
echo -e "-------------> Gerenciamento de redes<-------------\n"
sleep 2s
sudo apt install -y network-manager \
network-manager-gnome

sleep 1s
echo -e "Gerenciamento de redes.\n"

# Editores
echo -e "-------------> Editores <-------------\n"
sleep 2s
sudo apt install -y geany \
geany-plugins \
vim \
nano

sleep 1s
echo -e "Editores.\n"


#-------------------------------------------
## Correção ortográfica...
echo -e "-------------> Correção ortográfica <-------------\n"
sleep 2s
sudo apt install -y aspell \
aspell-pt-br

sleep 1s
echo -e "Correção ortográfica.\n"
#------------------------------
## Aparência...
echo -e "-------------> Aparência <-------------\n"
sleep 2s
sudo apt install -y lxappearance \
numix-gtk-theme \
numix-icon-theme \
numix-icon-theme-circle \
papirus-icon-theme \
arc-theme \
breeze-cursor-theme \
fonts-font-awesome 

sleep 1s
echo -e "Aparência.\n"
#--------------------------------
## Informações do sistema
echo -e "-------------> Editores <-------------\n"
sleep 2s
sudo apt install -y htop \
neofetch

sleep 1s
echo -e "Aparência.\n"
#---------------------------------------
## Gerenciamento da tela de login...
echo -e "-------------> tela de login <-------------\n"
sleep 2s
sudo apt install -y lightdm-gtk-greeter-settings \

sleep 1s
echo -e "tela de login.\n"

#----------------------------------------------
## Bluetooth...
echo -e "-------------> Bluetooth <-------------\n"
sleep 2s
sudo apt install -y blueman \
bluez

sleep 1s
echo -e "Bluetooth.\n"
#------------------------------------------------
## Gerenciamento de discos...
echo -e "------------->  discos <-------------\n"
sleep 2s
sudo apt install -y gparted

sleep 1s
echo -e " discos.\n"

#----------------------------------
## Navegadores...
echo -e "-------------> Navegadores <-------------\n"
sleep 2s
sudo apt install -y firefox-esr \
firefox-esr-l10n-pt-br

sleep 1s
echo -e "Navegadores.\n"

#-------------------------------------------------------
## Torrent...
echo -e "-------------> Torrent <-------------\n"
sleep 2s
sudo apt install -y transmission

sleep 1s
echo -e "Torrent.\n"
#----------------------------------------------
## Download de vídeos...
echo -e "-------------> Download de vídeos <-------------\n"
sleep 2s
sudo apt install -y youtube-dl

sleep 1s
echo -e "Download de vídeos.\n"
#----------------------------
## SMPlayer...
echo -e "-------------> SMPlayer <-------------\n"
sleep 2s
sudo apt install -y smplayer \
smplayer-l10n \
smplayer-themes

sleep 1s
echo -e "SMPlayer.\n"
#---------------------------------------
## VLC...
echo -e "-------------> VLC <-------------\n"
sleep 2s
sudo apt install -y vlc \
vlc-l10n

sleep 1s
echo -e "VLC.\n"

## Editor de áudio...
echo -e "-------------> áudio <-------------\n"
sleep 2s
sudo apt install -y audacity 

sleep 1s
echo -e "áudio.\n"

#------------------------------------------
## Suíte LibreOffice
echo -e "-------------> LibreOffice <-------------\n"
sleep 2s
sudo apt install -y libreoffice \
libreoffice-l10n-pt-br \
libreoffice-gnome \
libreoffice-style-breeze

sleep 1s
echo -e "LibreOffice.\n"
#----------------------------------
## Leitor de PDF
echo -e "-------------> PDF <-------------\n"
sleep 2s
sudo apt install -y atril 

sleep 1s
echo -e "PDF.\n"
#--------------------------------------
## Calculadora
echo -e "-------------> Calculadora <-------------\n"
sleep 2s
sudo apt install -y gnome-calculator 

sleep 1s
echo -e "Calculadora.\n"
#-------------------------------------

## Editor de imagens
echo -e "-------------> imagens <-------------\n"
sleep 2s
sudo apt install -y gimp

sleep 1s
echo -e "imagens.\n"

#-------------------------------------------------------

## Visualizadores de imagens
echo -e "-------------> imagens <-------------\n"
sleep 2s
sudo apt install -y sxiv
 
 sleep 1s
echo -e "imagens.\n"
#-------------------------------------------------
## Captura de tela (screenshots)
echo -e "-------------> screenshots <-------------\n"
sleep 2s
sudo apt install -y xfce4-screenshooter

sleep 1s
echo -e "screenshots.\n"
#---------------------------------
## Paciência e Freecell...
echo -e "-------------> Paciência  <-------------\n"
sleep 2s
sudo apt install -y aisleriot

sleep 1s
echo -e "Paciência .\n"
#----------------------------------------------------------
## XDG
echo -e "-------------> XDG <-------------\n"
sleep 2s
sudo apt install -y xdg-user-dirs \
xdg-utils

sleep 1s
echo -e "XDG.\n"
#----------------------------------------------
#  flatpak
echo -e "-------------> flatpak <-------------\n"
sleep 2s
sudo apt install -y flatpak \
gnome-software-plugin-flatpak \
gnome-software 

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sleep 1s
echo -e "flatpak.\n"

#----------------------------------------------------

# Atualizando o firmware do processador
echo -e "-------------> Atualizando o firmware do processador <-------------\n"
sleep 2s
sudo apt install -y intel-microcode
# Se tiver processador AMD, descomente a linha abaixo:
# sudo apt install amd64-microcode -y
sleep 1s
echo -e "Firmware atualizado.\n"

# Alterando o valor da swappiness para melhorar a performance
echo -e "-------------> Alterando o valor da swappiness <-------------\n"
sleep 2s
echo vm.swappiness=5 | sudo tee -a /etc/sysctl.conf
sleep 1s
echo -e "Swappiness alterado.\n"

# Atualizando o sistema novamente após mudanças
echo -e "  ---------> Atualizando o sistema novamente <------------ \n"
sleep 2s
sudo apt update && sudo apt upgrade -y
sleep 1s
echo -e "Sistema atualizado novamente.\n"

# Limpando pacotes antigos e desnecessários
echo -e "---------> Comando autoremove <---------\n"
sleep 2s
sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sleep 1s
echo -e "Limpeza concluída.\n"

# Criando pastas do usuário
echo -e "---------> Criando pastas do usuário <---------\n"
sleep 2s
xdg-user-dirs-update
sleep 1s
echo -e "usuário.\n"

# Finalizando
echo -e "---------> Configuração concluída <---------\n"
sleep 1s
echo -e "Sistema pronto para uso!\n"

# Bem-vindo à Debian
echo -e "Bem-vindo ao Debian, $PESSOA!\n"
echo -e "O Debian é uma das distribuições Linux mais confiáveis e estáveis. Agora, seu sistema está otimizado e pronto para uso!\n"

sleep 3s

