#-------------------------------------------
# OMZ Config  
#-------------------------------------------
export ZSH="$HOME/.config/zsh/ohmyzsh"

ZSH_THEME="dst"
#ZSH_THEME="custom-dst"
#ZSH_THEME="powerlevel10k/powerlevel10k"
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
export EDITOR=vim
export GIT_EDITOR=vim
export PAGER=delta

## System path
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:$HOME/.cargo/bin"

## NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## Alias and Function 
source $HOME/.config/zsh/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
