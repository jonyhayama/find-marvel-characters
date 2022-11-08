FROM ruby:3.1.2

# allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# Ensure up to date nodejs install
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

# install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs

COPY . /usr/src/app/
WORKDIR /usr/src/app

RUN gem install bundler:2.3.7
RUN bundle install
RUN npm install
RUN npm run build

EXPOSE 3000