# Datos Científicos

Sitio web de http://datoscientificos.cl

## Instrucciones

Primero hay que construir la imagen Docker de la aplicación. Para ello
usamos `docker compose`.

```bash
docker compose build
```

Luego levantamos la aplicación por primera vez.

```bash
docker compose up
```

En una terminal a parte, hay que crear el esquema de la base de datos.

```bash
docker compose run web bin/rake db:migrate RAILS_ENV=production
```

Ahora la aplicación está visible en http:0.0.0.0:3000.

Se puede detener y levantar la aplicación con:

```bash
docker compose down
docker compose up
```
