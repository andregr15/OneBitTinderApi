FROM ruby:2.5.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev imagemagick curl gcc make proj-bin \
  libgeos-dev libxml2 libjson-c-dev gdal-bin postgis

RUN apt-get install -y gnupg

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /gems

COPY . .