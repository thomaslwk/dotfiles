#-------------------------------------------
# OMZ Config  
#-------------------------------------------
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="custom-dst"
#ZSH_THEME="custom-dst"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

plugins=(
	git
	fzf
	tmux 
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

#-------------------------------------------
# fzf  
#-------------------------------------------
export FZF_DEFAULT_OPTS='--height 40% 
--layout=reverse --border=rounded
--color=dark
'
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='rg --files --hidden'

unsetopt sharehistory

#-------------------------------------------
# configurations
#-------------------------------------------
## Main 
export EDITOR=nvim
export GIT_EDITOR=nvim

## System path
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/bin"

## NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## Alias and Function 
source $HOME/.zsh_aliases
source $HOME/.zsh_functions



