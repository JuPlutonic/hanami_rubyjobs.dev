FROM ruby:2.7-bullseye

RUN apt-get update && apt-get install --assume-yes postgresql postgresql-client
RUN apt-get install git

RUN bundle config --global frozen 1

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test -j 5
ADD . /app

ENV LANG=en_US.UTF-8
ENV HANAMI_HOST=0.0.0.0
ENV HANAMI_ENV=production

EXPOSE 2300

CMD hanami db migrate && puma -t 5:5 -p 2300 -e production
