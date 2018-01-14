FROM ubuntu:16.04

RUN apt-get update && apt-get -y install \
      curl \
      git \
      locales \
      python-pip \
      sudo \
      tmux \
      vim \
      zsh && \
    locale-gen en_US.UTF-8 && \
    pip install --upgrade pip && \ 
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/cache/* && \
    rm -rf /var/lib/log/*

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

COPY vim /root/.vim
COPY tmux /root/.tmux

WORKDIR /root
RUN git clone https://github.com/davechouinard/linux.git && \
    cd linux/dotfiles && \
    sh ./docker-setup.sh

ENTRYPOINT ["/bin/zsh"]
