FROM alpine

WORKDIR /root

RUN apk update
RUN apk upgrade

RUN apk add zsh git curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY zsh/.zshrc .zshrc
RUN ls .oh-my-zsh/custom
RUN zsh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions)"
RUN zsh -c "$(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting)"

RUN apk add nodejs yarn npm
RUN apk add go

RUN apk add tmux
RUN apk add neovim
COPY nvim ./.config/nvim
RUN sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN nvim --headless +PlugInstall +qa

CMD ["zsh"]
