#! /bin/bash

echo "Installing all the packages"

sudo apt update

# Installing node version manager (nvm)
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source ~/.profile
nvm install latest

sudo apt install -yq libwebkit2gtk-4.0-dev \
	build-essential
	libssl-dev
	libgtk-3-dev
	libayatana-appindicator3-dev
	librsvg2-dev

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# yarn and pnpm
npm i -g yarn pnpm

# Deno
sudo apt install unzip
curl -fsSL https://deno.land/install.sh | sh

# Vim
sudo apt install vim

# neovim
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo apt install -y ./nvim-linux64.deb

rm -r nvim-linux64.deb

# Git
sudo apt install git

# powerline
sudo apt install -y python3-pip
pip3 install --user powerline-status
pip3 install powerline-gitstatus

mkdir -p ~/.config/powerline/colorschemes
mkdir -p ~/.config/powerline/themes/shell

cd ~/.config/powerline/colorschemes/
git clone --depth 1 https://gist.github.com/39a60757df3d8bbca99d96811561d409.git my-color-scheme
mv my-color-scheme/my-powerline-colorscheme.json default.json
sudo rm -r my-color-scheme

cd ~/.config/powerline/themes/shell/
git clone --depth 1 https://gist.github.com/03a4e4eb58038e9e683b1f839fd63250.git  my-shell-scheme
mv my-shell-scheme/my-powerline-shell-theme.json default.json
sudo rm -r my-shell-scheme

cd ~/

source .bashrc
