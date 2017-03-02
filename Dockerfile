FROM ruby:2.3.3
WORKDIR /usr/src/app
ENV RAILS_ENV production
ADD . /usr/src/app
RUN apt-get update && \
    apt-get -y install nodejs redis-server && \
    bin/bundle install --without test development && \
    bin/rails assets:precompile
CMD (redis-server &) && bin/rails s
