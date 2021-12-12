# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

#########################
# ### # ZSH Configs #### #
#########################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

#################
# ### ALIAS ### # 
#################


###################
# ### PLUGINS ### #
###################
plugins=(
  git
  dnf
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#################
# ### PYENV ### # 
#################
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
PATH=$(pyenv root)/shims:$PATH

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


