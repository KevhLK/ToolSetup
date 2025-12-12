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
echo -e "\n${turquoisecolour}--- ZSH SETUP ---${endcolour}\n"
echo -e "${greencolour}[+]${endcolour}${graycolour} Instalando ZSH...${endcolour}"
echo -e "${yellowcolour}[#] A continucacion proporciona tu contrasenya...${endcolour}"
sudo apt install zsh

echo -e "\n${greencolour}[+]${endcolour}${graycolour} Instalando OhMyZsh...${endcolour}"
if [[ -d "$HOME/.oh-my-zsh/" ]]; then 
  echo "${bluecolour}[·]${endcolour}${graycolour} OhMyZsh ya esta instalado, sigamos...${endcolour}"
else
  CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo -e "${bluecolour}[·]${endcolour}${graycolour} Oh my zsh ha sido instalado!${endcolour}"
fi

echo -e "\n${greencolour}[+]${endcolour}${graycolour} Obteniendo el tema p10k...${endcolour}"
if [[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then 
  echo -e "${bluecolour}[·]${endcolour}${graycolour} Ya tienes el p10k no hace falta instalarlo!${endcolour}"
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo -e "${bluecolour}[·]${endcolour}${graycolour} Ya tenemos el p10k!${endcolour}"
fi

chsh -s $(which zsh) # ZSH como shell predet.

# 
echo -e "\n${redcolour}--- REINCIA LA SESION PARA ESTABLECER LA ZSH CORRECTAAMENTE ---${endcolour}\n"

