# ToolSetup - Scirpt auto instalación de Herramientas
#### By KevhLK
---
Este es un script de auto instalación que recopila las herramientas que utilizo habitualmente en distribuciones Linux basadas en Debian. Aunque las herramientas están pensadas para mi flujo de trabajo personal, este script sirve como una base de partida para que otros usuarios puedan:

* Adaptar y crear su propio script de instalación.
* Instalar rápidamente un conjunto de utilidades probadas en entornos Debian.

## Que instala este script?
* Shell ZSH + OhMyZsh + el tema powerlevel10k 
* net-tools 
* unrar 
* ripgrep
* git 
* curl 
* wget 
* btop 
* zoxide 
* tmux + (config opcional)
* screen 
* python3 python3-pip 
* bat 
* make
* ssh (Opcional)
* Plugins de terminal (zsh-autosuggestions, zsh-syntax-highlighting, sudo.plugin.zsh)
* nvim + NvChad (Opcional)

## Instalación / Ejecución
Clonamos el repositorio: 
```bash
git clone https://github.com/KevhLK/ToolSetup.git
```

Entramos en la carpeta:
```bash
cd ToolSetup
```

Damos permiso de ejecucion a los archivos
```bash
chmod +x zshSetup.sh
chmod +x toolsSetup.sh
```

Y los debemos ejecutar, primeramente debemos ejecutar el zshSetup:
```bash
./zshSetup.sh
```

Cuando acabe el script debemos cerrar session y volver a iniciarla para ahora si ejecutar el segundo script:
```bash
./toolsSetup.sh
```

Cuando acabe cerramos la terminal la volvemos a abrir y completamos la configuración del tema de la zsh.

Por ultimo escribiremos nvim en terminal para que se configure el NvChad.
```bash
nvim
```

---
### 📜 Licencia:
* Este proyecto está bajo la Licencia **MIT**. Para más detalles, consulta el archivo completo [LICENSE](LICENSE).
