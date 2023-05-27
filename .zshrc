# ================================= #
# ========= ZSHRC CONFIG ========== # 
# ================================= #

################
# ## SET UP ## # 
################
## ZSH PATHS #
export ZSH=$HOME/.config/.zsh
## ZSH HISTORY  
export HISTFILE=$ZSH/.zsh_history 
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS 

## VIM 
export EDITOR=vim

# ================================== # 
# ==== Oh-my-zsh installation ====== #
# ================================== # 
export ZSH="$HOME/.dotfiles/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom/plugins"
ZSH_THEME="custom"
source $ZSH/oh-my-zsh.sh
## PLUGINS
plugins=(
  git
  tmux
  zsh-autosuggestions
  fzf-zsh-plugin
)
###########
## ALIAS ##
###########
alias g='git'
alias gs='git status'
alias ls='ls -l'
# alias ls='ls -lAFh'
# alias exa='exa -laFh --git'
alias bbd='brew bundle dump --force --describe'
######################
## CUSTOM FUNCTIONS ##
######################
## Make Directory Function 
function mkcd() {
  mkdir -p "$@" && cd "$_";
}
## Check directory exist
function exists() {
  command -v $1 > /dev/null 2>&1
}


# ================================== # 
# ========= SET VARIABLES ========== #
# ================================== # 
# Pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM 
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# =============================== #
# ## LOCATION $PATH VARIABLES ## #
# =============================== #
## HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

## ANDROID
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

## VSCode 
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 

## GOLANG 
export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
