apt update

# Init base16-shell
git submodule init
git submodule update

# Install
apt install zsh

# Setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get custom plugins
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

pip3 install thefuck

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node

# Base64 shell (Fancy colors)
ln -s "$(pwd)/base16-shell" ~/.config/base16-shell

# Setup Docker
curl -fsSL https://get.docker.com | bash
groupadd docker
usermod -aG docker $USER

# Tmux
pip3 install powerline-status
ln -s "$(pwd)/.tmux.conf" "~/.tmux.conf"

echo "Setup complete. Docker requires to restart the machine before using, please do"
