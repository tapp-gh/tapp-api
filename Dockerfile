
FROM ruby:2.7.5-alpine

RUN apk add --update build-base git nodejs npm postgresql-client postgresql-dev shared-mime-info  tzdata

RUN gem install bundler:2.1.4

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]