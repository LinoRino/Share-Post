FROM ruby:3.2.2

RUN apt update -qq && apt install -y --no-install-recommends vim

ENV LANG=C.UTF-8

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY containers/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN rails tailwindcss:install
RUN apt update -qq && apt install -y --no-install-recommends vim libvips42
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
