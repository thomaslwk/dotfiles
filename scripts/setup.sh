#!/usr/bin/env bash

###################################
# #### Setup script for Mac ##### #
###################################

#################
# ### xcode ### # 
#################
# Install xcode 
echo "\nInstalling xcode requirements"
xcode-select --install 

######################
# #### Homebrew #### #
######################
# Check if Homebrew is installed. 
if test ! $(which brew); then 
	echo "Homebrew not found.\n Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi 

#########################
# #### Update brew #### #
######################### 
echo "\nUpdating homebrew..."
brew update 

#################
# #### Git #### #
#################
echo "\nInstalling git."
brew install git 
echo "\nSetting up Git config." 
git config --global user.email "thomaslwk1@gmail.com"
git config --global user.name "thomaslwk"

################################
# #### Install brew stuff #### #
################################
brew install tmux 
brew install ranger 
brew instal htop
brew install fzf
brew install vim 
brew install wget 
brew install curl
brew install zsh-syntax-highlighting

###############################
# #### Install brew cask #### #
###############################
brew tap caskroom/fonts 
brew cask install font-fira-code

##########################
# #### Cleanup brew #### #
##########################
echo "\nBrew cleanup..."
brew cleanup 

###########################
# #### setup symlink #### #
###########################
ln -s ~/projects/dot-files/mac-conf/.tmux.conf ~/.tmux.conf
ln -s ~/projects/dot-files/mac-conf/.vimrc ~/.vimrc
ln -s ~/projects/dot-files/mac-conf/.zshrc ~/.zshrc

