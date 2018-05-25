FROM ruby:2.4

RUN \
    apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && \
    mkdir /webapp

WORKDIR /webapp

COPY . .

RUN bundle && \
    bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_KEY_BASE=blah SECRET_TOKEN=pickasecuretoken assets:precompile && \
    chown -R 1001:0 /webapp && \
    chmod -R 777 /webapp

USER 1001

CMD bundle exec puma
