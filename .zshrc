export ZSH=$HOME/.oh-my-zsh

# Somehow this is not set on MacOS by default...
export EDITOR=nvim

# https://github.com/spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose gh rails ruby)

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

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

alias muxi="tmuxinator"

[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm

# Add in kubernetes kubectl support
source <(kubectl completion zsh)

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  export PATH=$PATH:"$HOME/development/Dictu"

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
