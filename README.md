###### For  collecting errors app uses [Rollbar](https://docs.rollbar.com/docs/ruby#section-getting-started)

## Setup

There is Dockerfile, ruby version in this file: 2.6.6

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

Additional configuration for development (with [(linux)brew](https://brew.sh)).
Use dotenv gem to set environmental variables automatically. As well if you a zsh-user see
[plugin-sourcing-into-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/dotenv).
Copy files from development_docker/ to the project's root
and while you using development environment you should rename/move .dockerignore file.

```bash
pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start
export MODERATION_LOGIN="login"
export MODERATION_PASSWORD="password"
export ROLLBAR_KEY = 'test'
redis-server /home/linuxbrew/.linuxbrew/etc/redis.conf
export REDISTOGO_URL="redis://localhost:6379"
export SERVE_STATIC_ASSETS="true"
MODERATION_SESSIONS_SECRET=`cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64`
WEB_SESSIONS_SECRET=`cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64`
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.0.beta1/), or jump in [chat](http://chat.hanamirb.org) or in gitter chat [![Gitter](https://badges.gitter.im/hanami/chat.svg)](https://gitter.im/hanami/chat) for help. Enjoy! 🌸

Released under MIT License.

Original idea © 2016-2019 Anton Davydov. See [his stream records (rus)](https://www.youtube.com/playlist?list=PL6n1fvXhQN4kOm_HhBDJrynj6_dcl7VJP) about  some features implementation appeared in this repository.
