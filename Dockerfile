FROM ruby:2.4

RUN \
    apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /webapp

WORKDIR /webapp
COPY Gemfile Gemfile

RUN bundle

COPY . .

USER 1001

RUN chown -R 1001:0 /webapp

RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

CMD bundle exec puma
