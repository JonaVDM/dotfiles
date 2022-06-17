# Dotfiles

The dotfiles I use across my development systems.

## Setup

The setup for these Dotfiles are handled by a Ansible-Role, this can be found [here](https://github.com/JonaVDM/dotfiles-role)

If you want to do this manually, than these are the symbolic links that you need to run.

```bash
# For everything
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/alacritty" ~/.config/alacritty

# MacOS
ln -s "$(pwd)/hammerspoon" ~/.hammerspoon
```

## Oh my zsh

The zsh config makes use of [oh my zsh](https://ohmyz.sh/). It uses a few extra plugins in order to look nice, these are:

- [Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)
- [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

These can be quickly installed using the following

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

## Other configs
[NeoVIM Config](https://github.com/JonaVDM/neovim-config).

[Sway Config](https://github.com/JonaVDM/sway-config).


