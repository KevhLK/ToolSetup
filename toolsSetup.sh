#!/bin/bash
# Script de continuacion al zshSetup donde se instalan las tools y se añaden las caracteristicas y plugins necesarias:

# Colours
greencolour="\e[0;32m\033[1m"
endcolour="\033[0m\e[0m"
redcolour="\e[0;31m\033[1m"
bluecolour="\e[0;34m\033[1m"
yellowcolour="\e[0;33m\033[1m"
purplecolour="\e[0;35m\033[1m"
turquoisecolour="\e[0;36m\033[1m"
graycolour="\e[0;37m\033[1m"

# FUNCIONES
installTools ()
{ 
tools_to_install="net-tools unrar ripgrep git curl wget btop zoxide tmux screen python3 python3-pip bat make"
echo -e "\n${purplecolour}--- Actualizando la lista de paquetes con apt ---${endcolour}"
sudo apt update || { echo -e "${redcolour}[!] ERROR al actualizar apt.${endcolour}"; exit 1; }

echo -e "\n${purplecolour}--- Instalando herramientas ---${endcolour}"
sudo apt install -y $tools_to_install || { echo -e "[!] ERROR al instalar herramientas."; exit 1; }
sudo snap install lsd
echo -e "\n${purplecolour}--- Herramientas instaladas ---${endcolour}"
}

install_plugins ()
{
echo -e "\n${greencolour}[+]${endcolour}${graycolour} Instalando extensiones para la shell...${endcolour}"
mkdir -p $HOME/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
wget -O ~/.zsh/sudo.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
echo -e "${greencolour}[+]${endcolour}${graycolour} Extensiones instaladas!${endcolour}"
}

adds_to_zshrc ()
{
echo -e "\n${greencolour}[+]${endcolour}${graycolour} Añadiendo contenido a la configuracion de tu zshrc...${endcolour}"

sed -i 's#^ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc

echo "#ALIASES
# bat
alias cat='batcat'
alias catn='batcat --style=plain'
alias catnp='batcat --style=plain --paging=never'

# ls
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
" >> $HOME/.zshrc

cat << 'EOF_COLORS' >> $HOME/.zshrc
export LS_COLORS="rs=0:di=34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
EOF_COLORS

echo "#Plugins

if [ -d "$HOME/.zsh/zsh-autosuggestions" ]; then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f "$HOME/.zsh/sudo.plugin.zsh" ]; then
    source $HOME/.zsh/sudo.plugin.zsh
fi" >> $HOME/.zshrc

echo '# zoxide:' >> $HOME/.zshrc
echo 'eval "$(zoxide init zsh)"' >> $HOME/.zshrc
}

setup_neovim_config() 
{
echo "\n${greencolour}[+]${endcolour}${graycolour} Configurando NeoVim...${endcolour}"
echo "${redcolour}[!]${endcolour}${graycolour} Quieres seguir configurando Nvim? Se eliminará el programa para instalar la version mas reciente y aplicaremos el NvChad, en caso de ya tenerlo o no querer que se reinstale indique '${redcolour}no${endcolour}${graycolour}' a continuación, en caso de querer proceder, indique '${greencolour}si${endcolour}${graycolour}', (si/no en minusculas): ${endcolour}"
read siNo

if [[ $siNo == si ]]; then
  if [[ -d $HOME/.config/nvim ]]; then
    # Borrado
    rm -rf ~/.config/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.local/share/nvim

    # Reinstalación
    sudo apt remove neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> $HOME/.zshrc
    git clone https://github.com/NvChad/starter ~/.config/nvim
  
  else
    sudo apt remove neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> $HOME/.zshrc
    git clone https://github.com/NvChad/starter ~/.config/nvim 
  fi
echo "${greencolour}[+]${endcolour}${graycolour} Listo! Reinicia la terminal y escribe 'nvim' para acabar de configurarlo.${endcolour}"

elif [[ $siNo == no ]]; then 
  echo "${bluecolour}[·]${endcolour}${graycolour} Cancelando la instalación de NVChad...${endcolour}"

else
  echo "${redcolour}[!] Error, no instalaremos el nvim al no reconcoder '$siNo'...${endcolour}"

fi
}

# Ejecucion FUNCIONES:
installTools
install_plugins
adds_to_zshrc
setup_neovim_config


