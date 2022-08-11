# Ruby on Rails 7 on Docker to Expenses Course

This boilerplate contains RoR 7 with PostgreSQL, import maps, turbo, stimulus, redis, and tailwind, all running in Docker.

**NOTE:** There is example has in mind Windows users

## Features
* Rails 7.0.3
* Ruby 3.1.2
* Dockerfile and Docker Compose configuration
* PostgreSQL database
* Redis
* Rubocop for linting
* Security checks with [Brakeman](https://github.com/presidentbeef/brakeman)
* Gems audit with [bundler-audit](https://github.com/rubysec/bundler-audit)

## Initial setup
```
cp .env.example .env
docker-compose build
docker-compose run --rm web bin/rails db:setup
```

## Running the Rails app
```
docker-compose up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker-compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker-compose run --rm web bin/rails c
```

## Running tests
```
docker-compose run --rm web bin/rspec
```

## Updating gems
```
docker-compose run --rm web bundle update
docker-compose up --build
```

## Create master key and credentials
```
Remove config/master.key and config/credentials.yml.enc

run docker-compose run --rm -e EDITOR=vim web bin/rails credentials:edit
```

## Production build
```
docker build -f production.Dockerfile .
```

## Access to terminal inside docker container
```
docker-compose exec web bash
```

### Rails with Docker inspiration
* [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
* [Docker for Rails Developers
Build, Ship, and Run Your Applications Everywhere](https://pragprog.com/titles/ridocker/docker-for-rails-developers/)
* [Ruby on Whales:
Dockerizing Ruby and Rails development](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)
