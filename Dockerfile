# Usamos una imagen de Ruby moderna y ligera que incluye Debian Bullseye
FROM ruby:2.7-slim-bullseye

# ... otras instalaciones de dependencias ...

# Instalamos la versión exacta de Bundler que pide el log
RUN gem install bundler:1.12.5

# Instalamos las dependencias necesarias para Rails
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client \
  curl \
  git \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /datoscientificos/rails

COPY rails .
# RUN chown -R datoscientificos:datoscientificos /datoscientificos/rails

RUN mkdir -p ../bundle && bundle install --path ../bundle

# Add a script to be executed every time the container starts.
COPY entrypoint.sh ../

# RUN chown -R datoscientificos:datoscientificos /datoscientificos

#RUN chmod +x entrypoint.sh
ENTRYPOINT ["../entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
