FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  vim \
  nodejs \
  default-mysql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV APP_ROOT /app
RUN bundle install
ADD . /app