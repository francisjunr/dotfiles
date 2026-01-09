#!/bin/bash

# remove all apps from dock
defaults write com.apple.dock persistent-apps -array && defaults write com.apple.dock persistent-others -array && killall Dock

# autohide dock
defaults write com.apple.dock autohide -bool true && killall Dock

# disable automatic rearranging of spaces based on recent usage
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock

# remove the last login message from terminal sessions
touch ~/.hushlogin

echo "installing xcode cli tools"
xcode-select --install

# GET CONFIG FILES
mkdir work
mkdir personal
cd personal
git clone https://github.com/francisjunr/dotfiles.git

echo "copying configs files to respective locations"
touch ~/.zshrc
cp dotfiles/.zshrc ~/.zshrc

touch ~/.tmux.conf
cp ~/personal/dotfiles/.tmux.conf ~/.tmux.conf

mkdir ~/.config

mkdir ~/.config/kitty
touch ~/.config/kitty/kitty.conf
cp ~/personal/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

mkdir ~/.config/skhd
touch ~/.config/skhd/skhd.rc
cp ~/personal/dotfiles/.config/skhd/skhdrc ~/.config/skhd/skhdrc

mkdir ~/.config/karabiner
touch ~/.config/karabiner/karabiner.json
cp ~/personal/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

echo "installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "adding homebrew to path"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# INSTALL GUI APPLICATIONS
echo "installing brave browser"
brew install --cask brave-browser

echo "installing kitty terminal emulator"
brew install --cask kitty

echo "installing insomnia api client"
brew install --cask insomnia

echo "installing obsidian"
brew install --cask obsidian

echo "installing slack"
brew install --cask slack

echo "installing microsoft teams"
brew install --cask microsoft-teams

echo "installing todoist"
brew install --cask todoist-app

echo "installing foobar2000 music player"
brew install --cask foobar2000

echo "installing karabiner elements"
brew install --cask karabiner-elements

echo "installing jankyborders"
brew tap FelixKratz/formulae
brew install borders

# INSTALL TERMINAL APPLICATIONS
brew install starship

echo "installing fzf"
brew install fzf

echo "installing ripgrep"
brew install ripgrep

echo "installing nodejs"
brew install node

echo "installing n (node version manager)"
sudo npm install -g n

echo "installing tmux"
brew install tmux

echo "installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions

echo "installing and starting skhd"
brew install asmvik/formulae/skhd && skhd --start-service

echo "installing and starting yabai"
brew install asmvik/formulae/yabai && yabai --start-services

echo "installing yazi"
brew install yazi

echo "installing aws cli"
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
# update the shebang line in the install script to use python 3 instead of just python 
sed -i '' '1s/$/3/' awscli-bundle/install
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

echo "installing serverless framework"
npm install -g serverless@3.38

echo "BUILDING NVIM FROM SOURCE"

mkdir build
echo "install nvim build prerequesits"
brew install ninja cmake gettext curl git

git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
cd


# generate ssh key for github
ssh-keygen -t ed25519 -C "amal.b@diagnal.com"


echo "POST SETUP STEPS"

echo "1. Add the following public ssh key to work github account"
cat ~/.ssh/id_ed25519.pub

echo "2. run aws configure to setup credentials for local deployments"

echo "3. Find your export credentials bash script from slack and copy it into ~/work/"

echo "Your Mac is all set to go, now get to work"
