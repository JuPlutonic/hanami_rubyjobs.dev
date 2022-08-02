# frozen_string_literal: true

# How many worker processes puma should run
#
# Use WEB_CONCURRENCY=0 to disable puma's clustered mode
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
# How many threads should exist in each worker's pool

threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
threads threads_count, threads_count
# Preload the app to boot the application before forking new workers
preload_app!
# Use the default rackup (config.ru) command
rackup DefaultRackup
# Specify the port that Puma will listen on
port ENV.fetch('PORT', 2300)
# Specify the environment Puma will run in
environment ENV.fetch('HANAMI_ENV', 'development')

# Shutdown the application before forking
before_fork do
  Hanami.shutdown
end
