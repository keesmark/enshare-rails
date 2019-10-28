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
RUN bundle install
ADD . /app
EXPOSE  80

ENV RAILS_ENV production