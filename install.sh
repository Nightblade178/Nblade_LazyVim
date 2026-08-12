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
make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && sudo dpkg -i nvim-*.deb
nvim -V1 -v
cd "$STARTDIR"

rm -rf /tmp/neovim

mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

rm -rf ~/.config/nvim/lua/
ln -s $(realpath lua) ~/.config/nvim/.
