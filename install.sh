#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing dotfiles..."

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP"

backup_if_exists() {
    local file="$1"
    if [ -e "$file" ] || [ -L "$file" ]; then
        echo "Backing up $file -> $BACKUP/"
        mv "$file" "$BACKUP/"
    fi
}

###############################################
# Install Bash configuration
###############################################

echo "==> Installing Bash configuration"

backup_if_exists "$HOME/.bashrc"
ln -sf "$REPO_DIR/bash/.bashrc" "$HOME/.bashrc"

backup_if_exists "$HOME/.bash_aliases"
ln -s "$REPO_DIR/bash/.bash_aliases" "$HOME/.bash_aliases"

backup_if_exists "$HOME/.bash_profile"
ln -s "$REPO_DIR/bash/.bash_profile" "$HOME/.bash_profile"

backup_if_exists "$HOME/.inputrc"
if [ -f "$REPO_DIR/bash/.inputrc" ]; then
    ln -s "$REPO_DIR/bash/.inputrc" "$HOME/.inputrc"
fi

###############################################
# Git configuration
###############################################

echo "==> Installing Git configuration"

backup_if_exists "$HOME/.gitconfig"
ln -s "$REPO_DIR/git/.gitconfig" "$HOME/.gitconfig"

###############################################
# SSH configuration (non-destructive)
###############################################

echo "==> Installing SSH configuration"

mkdir -p "$HOME/.ssh"
backup_if_exists "$HOME/.ssh/config"
ln -s "$REPO_DIR/ssh/config" "$HOME/.ssh/config"

###############################################
# MySQL toolkit
###############################################

echo "==> Installing MySQL toolkit into ~/bin"

mkdir -p "$HOME/bin"
for script in "$REPO_DIR/mysql-toolkit/bin/"*.sh; do
    scriptname="$(basename "$script")"
    backup_if_exists "$HOME/bin/$scriptname"
    ln -s "$script" "$HOME/bin/$scriptname"
done
chmod +x "$HOME/bin/"*.sh 2>/dev/null || true

###############################################
# Done
###############################################

echo "==> Installation complete!"
echo "Backup created at: $BACKUP"

echo "==> Symlinks installed:"
ls -l "$HOME" | grep bash
ls -l "$HOME/bin"

