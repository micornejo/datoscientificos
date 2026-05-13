FROM ruby:2.7-slim-bullseye

# Instalamos dependencias del sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configuramos el directorio
WORKDIR /datoscientificos/rails

# COPIAMOS los archivos de gemas primero para optimizar el cache
COPY rails/Gemfile rails/Gemfile.lock ./

# INSTALAMOS Bundler 1.12.5 y ejecutamos el install
RUN gem install bundler:1.12.5 && bundle _1.12.5_ install

# Copiamos el resto de la aplicación
COPY rails .

# Preparamos el entrypoint (asegúrate de que esté en la raíz de tu repo)
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
