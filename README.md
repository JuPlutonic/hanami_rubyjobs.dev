###### For  collecting errors app uses Rollbar.

## Setup

There is Dockerfile, ruby version in this file: 2.6.4

```
% docker build .
```

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% DATABASE_URL="postgres://PG_USER@localhost/hanami_rubyjobs"; bundle exec hanami console
```

How to run the development server:

```
% DATABASE_URL="postgres://PG_USER@localhost/hanami_rubyjobs"; bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% export DATABASE_URL="postgres://PG_USER@localhost/hanami_rubyjobs"; bundle exec hanami db prepare

% DATABASE_URL="postgres://PG_USER@localhost/hanami_rubyjobs" HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.0.beta1/), or jump in [chat](http://chat.hanamirb.org) or in gitter chat [![Gitter](https://badges.gitter.im/hanami/chat.svg)](https://gitter.im/hanami/chat) for help. Enjoy! 🌸
