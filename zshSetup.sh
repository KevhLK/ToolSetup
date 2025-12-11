#!/bin/bash
# Script para instalar ZSH y sus complementos principales:

# Colours
greencolour="\e[0;32m\033[1m"
endcolour="\033[0m\e[0m"
redcolour="\e[0;31m\033[1m"
bluecolour="\e[0;34m\033[1m"
yellowcolour="\e[0;33m\033[1m"
purplecolour="\e[0;35m\033[1m"
turquoisecolour="\e[0;36m\033[1m"
graycolour="\e[0;37m\033[1m"

# ZSHSETUP
echo -e "\n--- ZSH SETUP ---\n"
echo -e "[+] Instalando ZSH..."
echo -e "[#] A continucacion proporciona tu contrasenya..."
sudo apt install zsh

echo -e "\n[+] Instalando OhMyZsh..."
if [[ -d "$HOME/.oh-my-zsh/" ]]; then 
  echo "[·] OhMyZsh ya esta instalado, sigamos..."
else
  CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo -e "[·] Oh my zsh ha sido instalado!"
fi

echo -e "\n[+] Obteniendo el tema p10k..."
if [[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then 
  echo -e "[·] Ya tienes el p10k no hace falta instalarlo!"
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo -e "[·] Ya tenemos el p10k!"
fi

chsh -s $(which zsh) # ZSH como shell predet.

# 
echo -e "\n--- REINCIA LA SESION PARA ESTABLECER LA ZSH CORRECTAAMENTE ---\n"

