###### For  collecting errors app uses [Rollbar](https://docs.rollbar.com/docs/ruby#section-getting-started)
Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](https://docs.hanamirb.org/1.3.0/, or jump in [chat](http://chat.hanamirb.org) or in gitter chat [![Gitter](https://badges.gitter.im/hanami/chat.svg)](https://gitter.im/hanami/chat) for help. Enjoy! 🌸

## Setup

Prefer istallation and configuration for development with [(linux)brew](https://brew.sh)

```bash
# (Linux)brew already installed
brew install postgresql@12
initdb /home/linuxbrew/.linuxbrew/var/postgresql@12
brew install redis
# LAUNCH
postgres -D /home/linuxbrew/.linuxbrew/var/postgresql@12
redis-server /home/linuxbrew/.linuxbrew/etc/redis.conf
```

Use dotenv gem to set environmental variables automatically. \
As well if you a zsh-user see
[plugin-sourcing-into-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/dotenv)

```bash
export MODERATION_LOGIN="login"
export MODERATION_PASSWORD="password"
export ROLLBAR_KEY = 'test'
export REDISTOGO_URL="redis://localhost:6379"
export SERVE_STATIC_ASSETS="true"
MODERATION_SESSIONS_SECRET=`cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64`
WEB_SESSIONS_SECRET=`cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64`
export TELEGRAM_BOT_NAME="hamani_rjd_m8n"
# ...
```

Copy files from development_docker/ to the project's root \
and while you using development environment you should rename/move .dockerignore file

```bash
cp development_docker/* ./
docker build Dockerfile.development
```

## Basics

Prepare gems:

```bash
% bundle install
```

How to run tests

```bash
% bundle exec rake
```

How to run the development console

```bash
% bundle exec hanami console
```

How to run the development server

```bash
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments

```bash
% bundle exec hanami db prepare
% HANAMI_ENV=test bundle exec hanami db prepare
```
### Troubleshooting
If you are using peer authentication and get password request, update DATABASE_URL in .env.{ENVIRONMENT} not to include host.

Example

```bash
# .env.test

DATABASE_URL="postgres:///hanami_rubyjobs_test"

# .env.development

DATABASE_URL="postgres:///hanami_rubyjobs_development"

```

## Contributing

Please, read [CONTRIBUTING.md](https://github.com/davydovanton/rubyjobs.dev/blob/master/CONTRIBUTING.md) file.

## Copyright

Released under GNU General Public License.

Original idea © 2016-2019 Anton Davydov. See [his stream records (rus)](https://www.youtube.com/playlist?list=PL6n1fvXhQN4kOm_HhBDJrynj6_dcl7VJP) about  some features implementation appeared in this repository.
