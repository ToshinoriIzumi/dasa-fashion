FROM ubuntu:20.04

RUN useradd -m -s /bin/bash rails 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
    apt install -y vim git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdm-dev curl libpq-dev wget language-pack-ja-base language-pack-ja locales htop chromium-chromedriver libsqlite3-dev lsof redis-server && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt -y install nodejs && \
    locale-gen ja_JP.UTF-8 && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt update -y &&\
    apt install google-chrome-stable -y && \ 
    npm install -g yarn

USER rails

SHELL [ "/bin/bash", "-c" ]
WORKDIR /home/rails/app
ENV PATH=/home/rails/.rbenv/bin:$PATH
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    $HOME/.rbenv/bin/rbenv install 2.5.1 && \
    $HOME/.rbenv/bin/rbenv global 2.5.1 && \
    $HOME/.rbenv/shims/gem update --system && \
    $HOME/.rbenv/shims/gem install bundler && \
    $HOME/.rbenv/shims/gem install rails -v 5.2.1
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc