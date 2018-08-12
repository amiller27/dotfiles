#!/bin/bash

set -ex

sudo apt update

# Fish ppa
sudo add-apt-repository ppa:fish-shell/nightly-master -y

# Misc packages
sudo apt update
sudo apt install -y git \
                    wget \
                    curl \
                    build-essential \
                    cmake \
                    python3-pip \
                    python-dev \
                    python3-dev \
                    terminator \
                    ranger \
                    tree \
                    fish

# Powerline
sudo -H pip3 install powerline-status
sudo -H pip3 install powerline-gitstatus


# Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Vim
cp .vimrc $HOME
mkdir -p $HOME/.vim/unmanaged-plugins
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/unmanaged-plugins/vim-airline
patch $HOME/.vim/unmanaged-plugins/vim-airline/autoload/airline/extensions/tabline/ctrlspace.vim vim-airline.patch
cp -r .vim $HOME

# Everything else
cp -r .xbindkeysrc .gitconfig .config .bashrc .bash_aliases $HOME