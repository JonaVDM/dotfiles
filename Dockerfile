FROM alpine

WORKDIR /root

RUN apk update
RUN apk upgrade

RUN apk add zsh
RUN apk add git
RUN apk add curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN apk add nodejs yarn npm
RUN apk add go

RUN apk add tmux
RUN apk add neovim
COPY nvim ./.config/nvim
RUN sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN nvim --headless +PlugInstall +qa

CMD ["zsh"]
