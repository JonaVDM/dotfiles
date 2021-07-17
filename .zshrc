export ZSH=$HOME/.oh-my-zsh

# https://github.com/spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias shit)

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  [[ -s "/Users/jona/.gvm/scripts/gvm" ]] && source "/Users/jona/.gvm/scripts/gvm"

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

  export PATH="$PATH":"$HOME/.pub-cache/bin"
  export PATH=$PATH:"$HOME/development/Dictu"

  # Add in kubernetes kubectl support
  source <(kubectl completion zsh)

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
fi
