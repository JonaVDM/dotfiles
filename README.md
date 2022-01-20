# Dotfiles

# Setup
There is a setup script in the repo, but never had the change to test it out.
It is probaply saver to install/link everything together by hand.

Some of the symbolic links that need be done
```bash
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/alacritty" ~/.config/alacritty
```
