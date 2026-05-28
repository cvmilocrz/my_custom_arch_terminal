<div align="center">

# ZSH Dev Environment Installer

Configuración automática de un entorno moderno para desarrollo usando  
**ZSH + Oh My Zsh** en Arch Linux.

<br>

<p>
  <img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white">
  <img src="https://img.shields.io/badge/ZSH-F15A24?style=for-the-badge&logo=gnu-bash&logoColor=white">
  <img src="https://img.shields.io/badge/Oh_My_Zsh-000000?style=for-the-badge">
  <img src="https://img.shields.io/badge/Nerd_Fonts-111111?style=for-the-badge">
</p>

</div>

---

## Preview

<p align="center">
  <img src="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/screenshots/themes/agnoster.png" width="900">
</p>

---

## Features

- Instalación automática de paquetes necesarios
- Configuración limpia de `.zshrc`
- Instalación automática de Oh My Zsh
- Soporte para Nerd Fonts
- Autosuggestions
- Syntax Highlighting
- Plugins para Docker, Go y npm
- Aliases útiles para desarrollo
- Personalización automática del tema Agnoster

---

## Requirements

- Arch Linux
- Usuario con permisos `sudo`
- Conexión a internet

---

## Installation

### 1. Clonar repositorio

```bash
git clone TU_REPO.git
cd TU_REPO
```

---

### 2. Dar permisos

```bash
chmod +x install.sh
```

---

### 3. Ejecutar instalador

```bash
./install.sh
```

---

## Packages Installed

```text
zsh
git
curl
wget
unzip
powerline
powerline-fonts
ttf-meslo-nerd
zsh-autosuggestions
zsh-syntax-highlighting
```

---

## Included Plugins

```bash
plugins=(
  git
  sudo
  docker
  docker-compose
  golang
  npm
  history
)
```

---

## Included Aliases

| Alias | Command |
|---|---|
| `ll` | `ls -lah` |
| `gs` | `git status` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `dc` | `docker compose` |
| `dps` | `docker ps` |
| `cls` | `clear` |
| `k` | `kubectl` |

---

## Theme Customization

El script modifica automáticamente el tema `agnoster` usando una paleta:

- Verde oscuro
- Verde esmeralda
- Texto blanco

---

## Recommended Font

Configura tu terminal usando:

```text
MesloLGS Nerd Font
```

---

## Apply Changes

Reinicia sesión o ejecuta:

```bash
exec zsh
```

---

## Project Structure

```text
.
├── install.sh
└── README.md
```

---

## Compatibility

| Distribution | Status |
|---|---|
| Arch Linux | Supported |
| EndeavourOS | Supported |
| Manjaro | Supported |

---

## Notes

- El script reemplaza `~/.zshrc`
- Cambia tu shell por defecto a `zsh`
- Requiere permisos `sudo`

---

## License

MIT

---

<div align="center">

Made for developers who live in the terminal.

</div>
