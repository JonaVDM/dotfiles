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

# Sway
ln -s "$(pwd)/sway" ~/.config/sway
ln -s "$(pwd)/waybar" ~/.config/waybar
ln -s "$(pwd)/mako" ~/.config/mako
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

## Sway

A quick overview from all the keybindings used in the swayconfig.
The [h, j, k, l] come from vim and translate to [left, up, down, right].

| Keybinding                 | Function                                                 |
| -------------------------- | -------------------------------------------------------- |
| Mod + Enter                | Open terminal                                            |
| Mod + Control + Enter      | Open terminal without tmux                               |
| Mod + Shift + Enter        | Open terminal in floating mode                           |
| Mod + e                    | Open file explorer (Thunar)                              |
| Mod + Shift + e            | Open file explorer (Thunar) in floating mode             |
| Mod + b                    | Open browser (Firefox)                                   |
| Mod + Shift + q            | Kill window                                              |
| Mod + Space                | Open app launcher                                        |
| Mod + Shift + c            | Reload configuration                                     |
| Mod + [h, j, k, l]         | Focus to window in direction                             |
| Mod + Shift + [h, j, k, l] | Move window to direction                                 |
| Mod + 1..0                 | Switch to workspace 1..0                                 |
| Mod + Shift + 1..0         | Move window to workspace 1..0                            |
| Mod + f                    | Toggle fullscreen on current window                      |
| Mod + Shift + Space        | Toggle floating window mode for current screen           |
| Mod + d                    | Toggle focus between floating windows and tiling windows |
| Mod + a                    | Toggle focus to the parent window                        |
| Mod + Shift + Minus        | Move window to scratchpad                                |
| Mod + Minus                | Show application in scratchpad                           |
| Mod + Control + l          | Lock the screen                                          |
| Function mute              | Mute the volume                                          |
| Function volume up         | Volume up                                                |
| Function volume down       | Volume down                                              |
| Function stop              | Stop currently playing                                   |
| Function previous          | Play previous                                            |
| Function next              | Play next                                                |
| Function play/pause        | Toggle play/pause                                        |
| Mod + Print                | Make a screenshot                                        |
| Mod + Shift + Print        | Make a screenshot of selection                           |
| Mod + r                    | Go into resize mode                                      |

## Style for waybar

After placing waybar in the right folder you need to make sure to compile the scss down to css.

1. First make sure you have npm installed, after that install the `sass` package

```
npm i -g sass
```

2. After that run the following command in the right folder

```
sass --style=compressed --no-source-map style.scss style.css
```
