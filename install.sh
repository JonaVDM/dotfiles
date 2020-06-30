# Link dotfiles
ln -s ./zsh/.zshrc ~
ln -s ./hammerspoon ~/.hammerspoon

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#
# Install the packages via brew
#

## Get some beer from all the taps
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap mongodb/brew
brew tap teamookla/speedtest

## Install command line stuff
brew install git
brew install htop
brew install hub
brew install mongodb-community
brew install nodebrew
brew install speedtest
brew install thefuck
brew install tree
brew install wget
brew install zsh

## Install applications
brew cask install discord
brew cask install discord-canary
brew cask install disk-inventory-x
brew cask install docker
brew cask install firefox
brew cask install font-fira-code
brew cask install font-ubuntu-mono-derivative-powerline
brew cask install google-chrome
brew cask install hammerspoon
brew cask install iterm2
brew cask install keka
brew cask install lastpass
brew cask install mongodb-compass
brew cask install postman
brew cask install spotify
brew cask install visual-studio-code
brew cask install whatsapp

# Install oh my zsh
# Not sure if this is going to work. But we can do one thing manually right? We're not that lazy right? Right?
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
