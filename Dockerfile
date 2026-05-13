# syntax=docker/dockerfile:1
FROM debian:jessie
RUN apt-get update -qq && apt-get install -y \
    postgresql-client libpq-dev autoconf bison build-essential libssl-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev \
    libffi-dev libgdbm3 libgdbm-dev git-core sqlite3 libsqlite3-dev curl wget \
    ruby bundler

#RUN groupadd -r datoscientificos && \
#    useradd -r -g datoscientificos datoscientificos && \
#    mkdir -p /datoscientificos

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
