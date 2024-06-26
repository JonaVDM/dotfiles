# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zplugin ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions
zinit light felixr/docker-zsh-completion

export ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS='--height 20'
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

autoload -Uz compinit
compinit

export EDITOR=nvim

# Macos Config
if [[ $(uname) == "Darwin" ]]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
  
  export PATH="$PATH":"$HOME/.pub-cache/bin"

  # Add in the latest version of ruby
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

  # To make sure it is using the right version of java
  export PATH="/usr/local/opt/openjdk/bin:$PATH"

  # add composer to the path
  export PATH="$HOME/.composer/vendor/bin:$PATH"

  # Because brew installs the 20, not 18
  export PATH="/usr/local/opt/node@18/bin:$PATH"
fi

# Linux config
if [[ $(uname) == "Linux" ]]; then
  # Run docker rootless
  export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
  export ANDROID_HOME="/home/jona/Android/Sdk"
fi

bindkey -s ^f "sh ~/.dotfiles/scripts/tmux-switcher.sh\n"
bindkey -s ^e "activate\n"

bindkey -s '\e[20;5~' "sh ~/.dotfiles/scripts/tmux-switcher.sh ~/Code\n"         # F9
bindkey -s '\e[21;5~' "sh ~/.dotfiles/scripts/tmux-switcher.sh ~/School\n"       # F10
bindkey -s '\e[23;5~' "sh ~/.dotfiles/scripts/tmux-switcher.sh ~/.dotfiles\n"    # F11
bindkey -s '\e[24;5~' "sh ~/.dotfiles/scripts/tmux-switcher.sh ~/.config/nvim\n" # F12

if command -v go &> /dev/null; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi

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
alias gfgl='git fetch && git pull'
alias clean='git reset --hard && git clean -f'
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias dcd='docker compose down'
alias dcu='docker compose up --build'
alias dcud='docker compose up --build -d'
alias dce='docker compose exec'
alias dcl='docker compose logs'
alias dcw='docker compose up --watch'
alias v='nvim'
alias pm="pnpm"
alias cl="clear"
alias kc="kubectl"

# never actually use it, unless you're done with your teammates
alias yolo='git add --all && git commit -m "$(curl --fail --silent https://whatthecommit.com/index.txt)" && git push'

alias git-count='git ls-files | while read f; do git blame --line-porcelain $f | grep "^author "; done | sort -f | uniq -ic | sort'

# Warning, this commands deletes pretty much everything. Ran into a lot of
# problems when gitlab decided my MR needed to be rebased. This command deletes
# all local branches except the current branch. Needles to say, you should
# probably never need or use this.
alias git-clean='git branch | grep -v "*" | xargs git branch -d'

# When cloning with `--bare`, sometimes it doesn't include this for some odd reason
alias git-fix='git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"'

# laravel sail alias
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias lara='docker compose exec app php artisan'

# Quicker go things
alias gotest='go test ./...'

# pnpm
export PNPM_HOME="$HOME/.pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Zoxide
eval "$(zoxide init zsh)"

activate() {
  if [[ $# -eq 1 ]]; then
    selected=$1
  else
    selected=$(find ~/.venv -mindepth 1 -maxdepth 1 -type d | fzf)
  fi
  source $selected/bin/activate
  tmux setenv VIRTUAL_ENV $VIRTUAL_ENV
}

if [ -n "$VIRTUAL_ENV" ]; then
  activate $VIRTUAL_ENV
fi

# laravel sail
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f /usr/share/nvm/init-nvm.sh ]] || source /usr/share/nvm/init-nvm.sh

autoload -U +X bashcompinit && bashcompinit

_az_python_argcomplete() {
    local IFS=$'\013'
    local SUPPRESS_SPACE=0
    if compopt +o nospace 2> /dev/null; then
        SUPPRESS_SPACE=1
    fi
    COMPREPLY=( $(IFS="$IFS" \
                  COMP_LINE="$COMP_LINE" \
                  COMP_POINT="$COMP_POINT" \
                  COMP_TYPE="$COMP_TYPE" \
                  _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
                  _ARGCOMPLETE=1 \
                  _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
                  "$1" 8>&1 9>&2 1>/dev/null 2>/dev/null) )
    if [[ $? != 0 ]]; then
        unset COMPREPLY
    elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "$COMPREPLY" =~ [=/:]$ ]]; then
        compopt -o nospace
    fi
}
complete -o nospace -o default -o bashdefault -F _az_python_argcomplete "az"
