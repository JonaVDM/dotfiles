FROM alpine

WORKDIR /root

ENV TERM=xterm-256color
ENV LC_CTYPE=UTF-8

RUN apk update && apk upgrade

RUN apk add \
    zsh \
    git \
    curl \
    openssh \
    nodejs \
    yarn \
    npm \
    python3 \
    py-pip \
    tmux \
    neovim \
    py3-psutil \
    py3-netifaces \
    zsh-vcs

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .zshrc .zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git .oh-my-zsh/custom/themes/spaceship-prompt --depth=1 
RUN ln -s /root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /root/.oh-my-zsh/custom/themes/spaceship.zsh-theme

COPY .tmux.conf .tmux.conf

COPY nvim .config/nvim
RUN sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN nvim --headless +PlugInstall +qa

RUN pip install powerline-status
RUN ln -s /usr/lib/python3.8/site-packages/powerline /usr/local/powerline
COPY powerline .config/powerline

CMD ["zsh"]
