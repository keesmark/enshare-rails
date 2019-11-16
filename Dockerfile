FROM ruby:2.6.3

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get update && apt-get install -y --no-install-recommends \
  yarn \
  build-essential \
  libpq-dev \
  vim \
  nodejs \
  default-mysql-client &&\
  apt-get clean &&\
  rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV APP_ROOT /app
ENV RAILS_ENV development
RUN bundle install
ADD . /app
EXPOSE  80

RUN RAILS_ENV=development bundle exec rake assets:precompile
RUN rm -f tmp/pids/server.pid
CMD ["bundle", "exec", "rails", "s", "puma", "-e", "production"]