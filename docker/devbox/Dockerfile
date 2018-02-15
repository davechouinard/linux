FROM ubuntu:17.10

RUN apt-get update \
  && apt-get -y install \
     dnsutils curl git locales python-pip tmux tzdata vim wget zsh apt-transport-https ca-certificates software-properties-common \
  && ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime \
  && pip install tmuxp \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && apt-get update && apt-get -y install docker-ce \
  && rm -rf /var/lib/apt/lists/* /usr/share/locale/* /usr/share/doc/* /usr/share/man/* \
  && curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
