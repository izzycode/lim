# LIM Application test

This is the repository of the LIM Application test.

## Installation

```
$ git clone git@github.com:matiasdh/lim.git
$ cd lim
$ rvm install 2.3.3
$ rvm use 2.3.3
$ bundle install
```

## Database Creation

```
$ cd config
$ cp database.yml.example database.yml #Be sure to tweak your DB settings
```

## Database Creation

To create the database simply:

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## Server Start Up

To start up the server you can do `rails s` or `rails server` like any regular rails app.

## Running Tests

The app uses [rspec](https://relishapp.com/rspec) to do testing.

```
$ rspec spec
```

## Routes

#### GET /api/v1/urls?page={page}

This endpoint retrieves all parsed urls in the system by page. The page paramter is optional and if not given will retrieve the first page of URLs. The page size is 25.

#### POST /api/v1/urls/parse?url={some_url}

This endpoint parses a given url. It should notify with errors if the url is malformed or the page couldn’t be reached. Should retrieve all the parsed tags, with it’s content and tag type (h1, h2, h3 or link).
