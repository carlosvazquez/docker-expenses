# Ruby on Rails 7 en Docker para Expenses

Esta plantilla contiene RoR 7 con PostgreSQL, importmaps, turbo, stimulus, redis y tailwind, corriendo en Docker.

**NOTA:** Esta plantilla está pensada en usuarios Windows.

## Opciones
* Rails 7.0.3
* Ruby 3.1.2
* Dockerfile y configuración Docker Compose
* base de datos PostgreSQL
* Redis
* Rubocop para linting
* Seguridad con [Brakeman](https://github.com/presidentbeef/brakeman)
* Autidoría de las gemas con Audit [bundler-audit](https://github.com/rubysec/bundler-audit)

## Setup inicial
```
cp .env.example .env
docker-compose build
docker-compose run --rm web bin/rails db:setup
```

## Iniciar la aplicación Rails
```
docker-compose up
```

## Correr la consola de Rails
Una vez corriendo el app con `docker-compose up` puedes enlazar la terminal con el contenedor:
```
docker-compose exec web bin/rails c
```

Si no hay contenedor corriendo puedes usar:
```
docker-compose run --rm web bin/rails c
```

## Correr tests
```
docker-compose run --rm web bin/rspec
```

## Actualizar gemas
```
docker-compose run --rm web bundle update
docker-compose up --build
```

## Crear la master key y las credenciales
Borrar los archivos config/master.key y config/credentials.yml.enc
```
run docker-compose run --rm -e EDITOR=vim web bin/rails credentials:edit
```

## Usar la terminal del contenedor:
```
docker-compose exec web bash
```

### Inspiración, configuración e ideas sobre Rails con Docker
* [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
* [Docker for Rails Developers
Build, Ship, and Run Your Applications Everywhere](https://pragprog.com/titles/ridocker/docker-for-rails-developers/)
* [Ruby on Whales:
Dockerizing Ruby and Rails development](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)
