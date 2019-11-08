FROM ruby:2.6.3

RUN apt-get rm -rf /var/lib/apt/lists/* update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  vim \
  nodejs \
  default-mysql-client \
  --no-install-recommends
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV APP_ROOT /app
ENV RAILS_ENV production
RUN bundle install
ADD . /app
EXPOSE  3000

CMD ["bundle", "exec", "rails", "s", "puma", "-e", "production"]