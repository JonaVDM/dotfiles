# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Export android tools and flutter
PATH=$PATH:$HOME/development/flutter/bin
PATH=$PATH:$HOME/Library/Android/sdk/tools/bin
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# typo stuff
eval $(thefuck --alias shit)

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git thefuck github lol zsh-autosuggestions docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias mstart="mongod --config /usr/local/etc/mongod.conf --fork"
alias mstop="mongo --eval \"db.getSiblingDB('admin').shutdownServer()\""

### Git
alias gtogether='git rebase -i HEAD~2'
alias gap='git add -p'
alias glogg='gloga'
alias goops='git checkout HEAD --'
alias git='hub'

# Python alias
alias py="python3"

# Node.JS
alias ns="npm start"
alias nw="npm run watch"
alias nt="npm test"
alias ni="npm install"
alias nr="npm run"

# Editor
alias co="code ."

# Alias for getting the ip address
alias ip="ipconfig getifaddr en0"
alias ipc="ifconfig | grep \"inet \""

# Alias to open current directory in finder
alias op="open ."

# Alias to open neovim a bit faster, because I'm super lazy
alias v="nvim"

# Just a stupid shortcut
alias mines="terminal-mines -w 80 -h 18"

# Remove the username so it doesnt show up in front of the path
USER=``
