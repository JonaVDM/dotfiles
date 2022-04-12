# Dotfiles

# Style for waybar
After placing waybar in the right folder you need to make sure to compile the scss down to css.

1. First make sure you have npm installed, after that install the `sass` package
```
npm i -g sass
```

2. After that run the following command in the right folder
```
sass --style=compressed --no-source-map style.scss style.css
```

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
