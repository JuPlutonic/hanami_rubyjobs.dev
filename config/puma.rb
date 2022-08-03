# frozen_string_literal: true

# How many worker processes puma should run
#
# Use WEB_CONCURRENCY=0 to disable puma's clustered mode
workers Container[:settings].web_concurrency || 2
# How many threads should exist in each worker's pool

threads_count = Container[:settings].threads_count || 5
threads threads_count, threads_count
# Preload the app to boot the application before forking new workers
preload_app!
# Use the default rackup (config.ru) command
rackup DefaultRackup
# Specify the port that Puma will listen on
port Container[:settings].port || 2300
# Specify the environment Puma will run in
environment Container[:settings].hanami_env_puma

# Shutdown the application before forking
before_fork do
  Hanami.shutdown
end
