#!/usr/bin/env bash
set -euo pipefail

HOME_DIR="${HOME:-/home/vscode}"
TEXLIVE_DIR="$HOME_DIR/.texlive"

if [ -e "$TEXLIVE_DIR" ] && [ ! -w "$TEXLIVE_DIR" ]; then
  sudo chown -R "$(id -u):$(id -g)" "$TEXLIVE_DIR"
fi

mkdir -p "$TEXLIVE_DIR/texmf-var" "$TEXLIVE_DIR/texmf-config"

latexmk -v
xelatex --version
chktex --version
kpsewhich article.cls >/dev/null
kpsewhich fontspec.sty >/dev/null

echo "LaTeX devcontainer is ready. Build with: make"
