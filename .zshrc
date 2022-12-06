# Zinit stuff
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zplugin ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions
zinit light felixr/docker-zsh-completion
autoload -Uz compinit
compinit

export EDITOR=nvim

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# if which pyenv-virtualenv-init > /dev/null; then
#   eval "$(pyenv virtualenv-init -)"
#   export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# fi

# [[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm

# Add in kubernetes kubectl support
source <(completion zsh)

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

  # To make sure it is using the right version of java
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Linux config
if [[ $(uname) == "Linux" ]]; then
  # Run docker rootless
  export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
fi

bindkey -s ^f "bash ~/.dotfiles/scripts/tmux-switcher.sh\n"

# Set up history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Alias setup
alias gaa='git add .'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch -a'
alias glog='git log --oneline --decorate --graph'
alias glg='git log --stat'
alias gst='git status'
alias gch='git checkout'
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias dcd='docker compose down'
alias dcu='docker compose up --build'
alias v='nvim'

alias git-count='git ls-files | while read f; do git blame --line-porcelain $f | grep "^author "; done | sort -f | uniq -ic | sort'
alias git-clean='g4it fetch -p ; git branch -r | awk "{print $1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print $1}" | xargs git branch -d'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
