export ZSH=$HOME/.oh-my-zsh

# https://github.com/spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose ruby rails)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias shit)

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  [[ -s "/Users/jona/.gvm/scripts/gvm" ]] && source "/Users/jona/.gvm/scripts/gvm"

  export PATH="$PATH":"$HOME/.pub-cache/bin"
  export PATH=$PATH:"$HOME/development/Dictu"

  # Add in kubernetes kubectl support
  source <(kubectl completion zsh)

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
fi

# WSL config
if [[ $(uname -a | grep microsoft) ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi
