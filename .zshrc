export ZSH=$HOME/.oh-my-zsh

# https://github.com/spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)

source $ZSH/oh-my-zsh.sh

# eval $(thefuck --alias shit)

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  export PATH=$PATH:"$HOME/development/Dictu"

  # Add in kubernetes kubectl support
  source <(kubectl completion zsh)

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
fi
