# Surfgo

Website: http://www.surfgo.surf

Heroku git: https://git.heroku.com/surfgo.git

## Requirements

- ruby 2.7.3
- node >= 14.17.4
- postgresql >= 13

## Install

```sh
bundle install
yarn install
```

Configure database (on macos):

```sh
psql
> create role Surf_Go superuser login;
```

Then:

```sh
rails db:create:all
rails db:migrate
rails db:seed
```

## Local

```sh
MAPBOX_API_KEY=key rails s
```

with `key` a valid Mapbox API key
