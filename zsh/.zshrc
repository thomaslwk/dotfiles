#-------------------------------------------
# ZSH Config
#-------------------------------------------

ZSH_THEME=""	# config for starship

## unused zsh theme
#ZSH_THEME="crcandy"

plugins=(
	git
	fzf
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZDOTDIR/ohmyzsh/oh-my-zsh.sh

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
export EDITOR=vim
export GIT_EDITOR=vim
export PAGER=delta

## System path
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:$HOME/.cargo/bin"

## Notes
export NOTES_DIRECTORY="$HOME/personal/notes"

## NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## Man Bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

## Alias and Function
source $HOME/.config/zsh/.zsh_aliases
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## Starship Prompt
eval "$(starship init zsh)"

