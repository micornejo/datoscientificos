FROM ruby:2.7-slim-bullseye

# Instalamos dependencias esenciales para compilar gemas antiguas
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    g++ \
    make \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /datoscientificos/rails

# Instalamos la versión exacta de Bundler
RUN gem install bundler:1.12.5

COPY rails/Gemfile rails/Gemfile.lock ./
RUN bundle _1.12.5_ install

COPY rails .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]