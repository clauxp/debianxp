#!/bin/bash

PESSOA=$(whoami) # Captura o nome do usuário
echo -e "-----------------------------------------------------\n"
echo -e "\033[33;1m-----> Iniciando atualizações do sistema, $PESSOA! <------\033[m\n"

# Atualização e upgrade dos pacotes
echo -e "\033[33;1m-----> Atualizando pacotes... <------\033[m\n"
sleep 1s
sudo apt update && sudo apt upgrade -y
echo -e "\033[32;1m-----> Atualização e upgrade concluídos! <------\033[m\n"

# Full-upgrade
echo -e "------------------------------------------------------\n"
echo -e "\033[33;1m-----> Executando full-upgrade... <-------\033[m\n"
sleep 1s
sudo apt full-upgrade -y
echo -e "\033[32;1m-----> Full-upgrade concluído! <------\033[m\n"

# Instalação de pacotes (opcional)
# Removido porque nenhum pacote foi especificado.
# echo -e "------------------------------------------------------\n"
# echo -e "\033[33;1m-----> Instale pacotes aqui se necessário... <-------\033[m\n"
# sleep 1s

# Limpeza do sistema
echo -e "------------------------------------------------------\n"
echo -e "\033[33;1m-----> Limpando pacotes desnecessários... <--------\033[m\n"
sleep 1s
sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
echo -e "\033[32;1m-----> Limpeza concluída! <------\033[m\n"

# Finalização
echo -e "-------------------------------------------------------\n"
echo -e "\033[33;1m-----> Todos os comandos foram executados com sucesso, $PESSOA! <-----\033[m\n"
