FROM ruby:2.7.2

RUN apt-get update && \
    apt-get install -y \
      default-mysql-client \
      vim \
      curl \
      zsh \
      cron \
      less \
      xvfb \
      ffmpeg \
      graphviz \
      redis-server \
      qt5-default \
      libqt5webkit5-dev \
      gstreamer1.0-plugins-base \
      gstreamer1.0-tools \
      gstreamer1.0-x \
      libprotobuf-dev \
      libprotoc-dev \
      protobuf-compiler && \
    apt-get autoremove -y && \
    apt-get clean all

RUN ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/bin/Magick-config

ENV LANG=C.UTF-8

RUN groupadd --gid 1000 app \
    && useradd --uid 1000 --gid app --shell /bin/bash --create-home app

RUN ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo Asia/Tokyo > /etc/timezone

RUN gem install bundler -v 2.2.33

WORKDIR /app
