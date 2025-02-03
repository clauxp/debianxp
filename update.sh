#!/bin/bash
PESSOA=$(whoami)
echo -e "-----------------------------------------------------\n"
echo -e "\033[33;1m-----> comando update upgrade <------\033[m\n"
sleep 2s
sudo apt update && sudo apt upgrade -y
sleep 2s
echo -e "------------------------------------------------------\n"
echo -e "\033[33;1m-----> comando full-upgrade <-------\033[m\n"
sleep 2s
sudo apt full-upgrade -y
echo -e "------------------------------------------------------\n"
echo -e "\033[33;1m-----> comando apt install <-------\033[m\n"
sleep 2s
sudo apt install
echo -e "------------------------------------------------------\n"
echo -e "\033[33;1m-----> comando autoremove <--------\033[m\n" 
sleep 2s
sudo apt clean && sudo apt autoclean &&  sudo apt autoremove && sudo apt autoremove --purge  -y
echo -e "-------------------------------------------------------\n"
sleep 1s
echo -e "\033[33;1m-----> comando deu certo $PESSOA <-----\033[m\n" 
