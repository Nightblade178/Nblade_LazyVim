#!/bin/bash
# required
sudo apt install vim cmake lazygit -y
sudo apt remove --purge neovim-runtime neovim

git clone https://github.com/neovim/neovim.git /tmp/neovim

cd /tmp/neovim && sudo cmake --build build/ --target uninstall

git checkout nightly
make CMAKE_BUILD_TYPE=Release
cd build && sudo cpack -G DEB && sudo dpkg -i nvim-*.deb
nvim -V1 -v

rm -rf /tmp/neovim
cd -

mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

rm -rf ~/.config/nvim/lua/
ln -s $(realpath lua) ~/.config/nvim/
