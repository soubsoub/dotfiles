#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing dotfiles..."

BACKUP="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP"

backup_if_exists() {
local file="$1"
if [ -e "$file" ] || [ -L "$file" ]; then
echo "Backing up $file -> $BACKUP/"
mv "$file" "$BACKUP/"
fi
}
