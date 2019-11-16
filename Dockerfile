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
<<<<<<< HEAD
  default-mysql-client &&\
  apt-get clean &&\
  rm -rf /var/lib/apt/lists/*

=======
  default-mysql-client \
  --no-install-recommends
>>>>>>> c39b30791fabec9673b2098602532c52c394da53
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV APP_ROOT /app
<<<<<<< HEAD
ENV RAILS_ENV development
RUN bundle install
ADD . /app
EXPOSE  80

RUN RAILS_ENV=development bundle exec rake assets:precompile
RUN rm -f tmp/pids/server.pid
=======
ENV RAILS_ENV production
RUN bundle install
ADD . /app
EXPOSE  3000

>>>>>>> c39b30791fabec9673b2098602532c52c394da53
CMD ["bundle", "exec", "rails", "s", "puma", "-e", "production"]