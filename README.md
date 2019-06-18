# Core
[![CircleCI](https://circleci.com/gh/davydovanton/rubyjobs.dev/tree/master.svg?style=svg)](https://circleci.com/gh/davydovanton/rubyjobs.dev/tree/master)

Welcome to your new Hanami project!

## Setup

There is Dockerfile, ruby version in this file: 2.6.3

```
% docker build .
```

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% DATABASE_URL="postgres://salessionato@localhost/hanami_rubyjobs"; bundle exec hanami console
```

How to run the development server:

```
% DATABASE_URL="postgres://salessionato@localhost/hanami_rubyjobs"; bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% export DATABASE_URL="postgres://salessionato@localhost/hanami_rubyjobs"; bundle exec hanami db prepare

% DATABASE_URL="postgres://salessionato@localhost/hanami_rubyjobs" HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.0.beta1/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
