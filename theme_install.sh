#!/bin/bash

set -e

echo "========================================="
echo " Instalando entorno ZSH personalizado"
echo "========================================="

# -----------------------------------------
# Actualizar sistema
# -----------------------------------------
sudo pacman -Syu --noconfirm

# -----------------------------------------
# Instalar paquetes base
# -----------------------------------------
sudo pacman -S --noconfirm \
    zsh \
    git \
    curl \
    wget \
    unzip \
    powerline \
    powerline-fonts \
    ttf-meslo-nerd \
    zsh-autosuggestions \
    zsh-syntax-highlighting

# -----------------------------------------
# Cambiar shell por defecto
# -----------------------------------------
if [[ "$SHELL" != *"zsh" ]]; then
    chsh -s /bin/zsh
fi

# -----------------------------------------
# Instalar Oh My Zsh
# -----------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -----------------------------------------
# Crear .zshrc limpio
# -----------------------------------------
cat > "$HOME/.zshrc" << 'EOF'
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  sudo
  docker
  docker-compose
  golang
  npm
  history
)

source $ZSH/oh-my-zsh.sh

# Plugins Arch Linux
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ll="ls -lah"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias dc="docker compose"
alias dps="docker ps"
alias cls="clear"
alias k="kubectl"

# Historial
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Autocomplete más rápido
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

EOF

# -----------------------------------------
# Personalizar Agnoster
# -----------------------------------------
THEME="$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

sed -i '
s|: ${AGNOSTER_DIR_FG:=.*}|: ${AGNOSTER_DIR_FG:=#ffffff}|;
s|: ${AGNOSTER_DIR_BG:=.*}|: ${AGNOSTER_DIR_BG:=#00312d}|;
s|: ${AGNOSTER_CONTEXT_FG:=.*}|: ${AGNOSTER_CONTEXT_FG:=#ffffff}|;
s|: ${AGNOSTER_CONTEXT_BG:=.*}|: ${AGNOSTER_CONTEXT_BG:=#00a465}|;
s|: ${AGNOSTER_GIT_CLEAN_FG:=.*}|: ${AGNOSTER_GIT_CLEAN_FG:=#ffffff}|;
s|: ${AGNOSTER_GIT_CLEAN_BG:=.*}|: ${AGNOSTER_GIT_CLEAN_BG:=#00a465}|;
s|: ${AGNOSTER_GIT_DIRTY_FG:=.*}|: ${AGNOSTER_GIT_DIRTY_FG:=#ffffff}|;
s|: ${AGNOSTER_GIT_DIRTY_BG:=.*}|: ${AGNOSTER_GIT_DIRTY_BG:=#00312d}|;
s|: ${AGNOSTER_STATUS_FG:=.*}|: ${AGNOSTER_STATUS_FG:=#ffffff}|;
s|: ${AGNOSTER_STATUS_BG:=.*}|: ${AGNOSTER_STATUS_BG:=#00312d}|;
s|: ${AGNOSTER_VENV_FG:=.*}|: ${AGNOSTER_VENV_FG:=#ffffff}|;
s|: ${AGNOSTER_VENV_BG:=.*}|: ${AGNOSTER_VENV_BG:=#00a465}|;
s|: ${AGNOSTER_AWS_FG:=.*}|: ${AGNOSTER_AWS_FG:=#ffffff}|;
s|: ${AGNOSTER_AWS_BG:=.*}|: ${AGNOSTER_AWS_BG:=#00312d}|;
' "$THEME"

# -----------------------------------------
# Config Git Prompt
# -----------------------------------------
git config --global oh-my-zsh.hide-status 1

# -----------------------------------------
# Mensaje final
# -----------------------------------------
echo ""
echo "========================================="
echo " Instalación completada"
echo "========================================="
echo ""
echo "Fuente recomendada:"
echo "MesloLGS Nerd Font"
echo ""
echo "Reinicia sesión o ejecuta:"
echo ""
echo "exec zsh"
echo ""
