# Dotfiles for soubsoub

This repo contains:

- `bash/` – my Bash configuration
- `git/` – my Git configuration
- `ssh/` – SSH client config
- `mysql-toolkit/` – small MySQL admin toolkit for teaching
- `.github/` – GitHub Actions workflow
- `install.sh` – installer (backups + symlinks)

## Quick install

```bash
git clone git@github.com:soubsoub/dotfiles.git
cd dotfiles
./install.sh

## Install on a new machine

```bash
git clone git@github.com:soubsoub/dotfiles.git
cd dotfiles
./install.sh
```
## This installer:
    Backs up any existing dotfiles
    Installs my optimized configurations
    Links everything cleanly
    Installs executable scripts into ~/bin/
GitHub CLI — push repo
After cloning / creating the repo:

gh repo create YOURUSER/dotfiles --public --source=. --remote=origin --push

## Directory Structure
See embedded tree above.
License

MIT License — feel free to reuse.
