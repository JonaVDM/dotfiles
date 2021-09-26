# Dotfiles

# Setup
There is a setup script in the repo, but never had the change to test it out.
It is probaply saver to install/link everything together by hand.

In order to download all the submodules:
```bash
git submodule update --init
```

Some of the symbolic links that need be done
```bash
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/alacritty" ~/.config/alacritty
ln -s "$(pwd)/nvim-config ~/.config/nvim
ln -s "$(pwd)/powerline" ~/.config/powerline
ln -s "$(pwd)/tmux-plugins" ~/.config/tmux-tpm
```
