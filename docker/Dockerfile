FROM ruby:2.5

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

RUN apt-get update && \
    apt-get install -y vim less && \
    apt-get install -y build-essential libpq-dev nodejs && \
    gem install bundler && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

WORKDIR /locker_app

COPY Gemfile \
     Gemfile.lock \
     /locker_app/

RUN bundle install

# https://github.com/bundler/bundler/issues/6154
ENV BUNDLE_GEMFILE='/locker_app/Gemfile'