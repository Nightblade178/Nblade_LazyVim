#!/bin/bash
# required
sudo apt install vim nvim
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

rm -rf ~/.config/nvim/lua/
ln -s $(realpath lua) ~/.config/nvim/
