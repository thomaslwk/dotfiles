#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

rm -rf $HOME/.config/git
ln -s $DOTFILES/git $HOME/.config/git

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/tmux
ln -s $DOTFILES/tmux $HOME/.config/tmux

rm -rf $HOME/.config/zsh
ln -s $DOTFILES/zsh $HOME/.config/zsh

rm -rf $HOME/.vimrc
ln -s $DOTFILES/vim/.vimrc $HOME/.vimrc

rm -rf $HOME/.config/ideavim
ln -s $DOTFILES/ideavim/ $HOME/.config/ideavim

rm -rf $HOME/.zshenv
ln -s $DOTFILES/zsh/.zshenv $HOME/.zshenv
