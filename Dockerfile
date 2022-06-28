FROM ruby:2.3.8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /chiebukuro
WORKDIR /chiebukuro

COPY Gemfile /chiebukuro/Gemfile
COPY Gemfile.lock /chiebukuro/Gemfile.lock

RUN bundle install
COPY . /chiebukuro