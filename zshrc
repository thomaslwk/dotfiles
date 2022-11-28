# ================================= #
# ========= ZSHRC CONFIG ========== # 
# ================================= #
echo "running .zshrc... "

################
# ## SET UP ## # 
################
export LANG=en_US.UTF-8

## Customize Prompt
PROMPT='%1~ %L %# '
## Right Prompt 
RPROMPT='%*'


###############
# ## ALIAS ## #
###############
alias ls='ls -lAFh'


##########################
# ## CUSTOM FUNCTIONS ## #
##########################

## Make Directory Function 
function mkcd() {
  mkdir -p "$@" && cd "$_";
}


#################
# ## PLUGINS ## #
#################



#######################
# ## SET VARIABLES ## #
#######################

# Pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


##################################
# ## LOCATION $PATH VARIABLES ## #
##################################

## HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

## ANDROID PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

## VSCode 
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 

