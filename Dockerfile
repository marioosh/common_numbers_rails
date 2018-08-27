FROM ruby:2.4.1

WORKDIR /usr/src/gem

ENV PATH=/usr/src/gem/bin:$PATH

ADD . .

RUN bundle install
