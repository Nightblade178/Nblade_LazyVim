#!/bin/bash
set -e # Stops if any error
# required
STARTDIR=$(pwd)
sudo apt install vim cmake lazygit -y
sudo apt remove --purge neovim-runtime neovim

rm -rf /tmp/neovim
git clone https://github.com/neovim/neovim.git /tmp/neovim

cd /tmp/neovim

git checkout stable
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local
sudo make install
nvim -V1 -v
cd "$STARTDIR"

rm -rf /tmp/neovim

[ -d ~/.config/nvim ] && mv ~/.config/nvim{,.bak}

# optional but recommended
[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim{,.bak}
[ -d ~/.local/state/nvim ] && mv ~/.local/state/nvim{,.bak}
[ -d ~/.cache/nvim ] && mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

rm -rf ~/.config/nvim/lua/
ln -s $(realpath lua) ~/.config/nvim/.
