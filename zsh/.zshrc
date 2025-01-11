#-------------------------------------------
# ZSH Config
#-------------------------------------------
ZSH_THEME=""

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
export FZF_DEFAULT_COMMAND='ag -u -g ""'
export FZF_DEFAULT_OPTS='
--border=rounded
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef,gutter:-1,border:#1f2335
'

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
#export NOTES_DIRECTORY="$HOME/personal/notes"

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
