# ================================= #
# ========= ZSHRC CONFIG ========== # 
# ================================= #

################
# ## SET UP ## # 
################
export LANG=en_US.UTF-8

## Customize Prompt
# PROMPT='%1~ %L %# '
# ## Right Prompt 
# RPROMPT='%*'

### ZSH PATHS
export ZSH=$HOME/.config/.zsh
ZSH_THEME="half-life"

###### ZSH HISTORY ######  
# Export history config 
export HISTFILE=$ZSH/.zsh_history 
# Load num of commands zsh will load in mem 
export HISTSIZE=10000
# Number of commands to save on file 
export SAVEHIST=10000
# Remove duplicates 
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS 


###############
# ## ALIAS ## #
###############
alias man=batman
#alias ls='ls -lAFh --git'
alias exa='exa -laFh --git'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

##########################
# ## CUSTOM FUNCTIONS ## #
##########################
## Make Directory Function 
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

## Check directory exist
function exists() {
  command -v $1 > /dev/null 2>&1
}


#################
# ## PLUGINS ## #
#################
plugins=(
  git
  fzf
  tmux
  zsh-autosuggestions
)

#######################
# ## SET VARIABLES ## #
#######################
# Pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM 
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh


##################################
# ## LOCATION $PATH VARIABLES ## #
##################################
## HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

## ANDROID
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

## VSCode 
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 


###################
# ## OH-MY-ZSH ## #
###################
source $ZSH/oh-my-zsh.sh

#########################
# ## STARSHIP PROMPT ## #
#########################
# eval "$(starship init zsh)"
