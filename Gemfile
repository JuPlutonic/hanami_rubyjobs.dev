# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 2.7.0'

# Rake is a Make-like program implemented in Ruby (https://github.com/ruby/rake)
gem 'rake'

##==presentation tier=http lr
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '4.3.12'
##======logic tier=http layer
# The web, with simplicity (http://hanamirb.org)
gem 'hanami', '1.3.0'
# Simple XML sitemap generator for Ruby/Rails applications. (http://github.com/sosedoff/xml-sitemap)
gem 'xml-sitemap'

##===========persistance tier
# A persistence layer for Hanami (http://hanamirb.org)
gem 'hanami-model', '~> 1.3'
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://bitbucket.org/ged/ruby-pg)
gem 'pg' # 'jdbc-postgres' for jruby
# The Database Toolkit for Ruby (http://sequel.jeremyevans.net)
gem 'sequel', '~> 4.48.0'

##=======dependency managment
# Organize your code into reusable components (http://dry-rb.org/gems/dry-system)
gem 'dry-system', '~> 0.9.2'
gem 'dry-system-hanami', github: 'davydovanton/dry-system-hanami'

##===================markdown
# kramdown is a fast, pure-Ruby Markdown-superset converter. (http://kramdown.gettalong.org)
gem 'kramdown', '2.3.2'
# Mostly autolinking (https://github.com/vmg/rinku)
gem 'rinku'
# A pure-ruby colorizer based on pygments (http://rouge.jneen.net/)
gem 'rouge', '3.26.1'

##==================front, templates
# Twitter bootstrap library for hanami applications (https://github.com/davydovanton/hanami-bootstrap)
gem 'hanami-bootstrap'
# jQuery for Hanami (http://rubygems.org/gems/jquery-hanami)
gem 'jquery-hanami'
# Micro lib without any dependensy for getting relative time (https://github.com/davydovanton/relative_time)
gem 'relative_time', github: 'davydovanton/relative_time', branch: 'master'
# A powerful but elegant CSS compiler that makes CSS fun again. (http://sass-lang.com/)
gem 'sass'
# Use libsass with Ruby! (https://github.com/sass/sassc-ruby)
gem 'sassc' # , '=2.1.0'
# Slim is a template language. (http://slim-lang.com/)
gem 'slim'
# Generic interface to multiple Ruby template engines (http://github.com/rtomayko/tilt/)
gem 'tilt', '~>2.0.10'

##=================pagination
# Pagination in your hanami apps (https://github.com/davydovanton/hanami-pagination)
gem 'hanami-pagination', github: 'davydovanton/hanami-pagination'

##=====monitoring and logging
# Reports exceptions to Rollbar (https://rollbar.com)
gem 'rollbar'
# Feature rich logging framework, and replacement for existing Ruby & Rails loggers. (https://github.com/rocketjob/semantic_logger)
gem 'semantic_logger'

##=====business logic section
# Common monads for Ruby. (https://github.com/dry-rb/dry-monads)
gem 'dry-monads', '~> 1.1.0'

##=================background
# Ruby wrapper for hiredis (protocol serialization/deserialization and blocking I/O) (http://github.com/redis/hiredis-rb)
gem 'hiredis'
# Simple, efficient background processing for Ruby (http://sidekiq.org)
# gem 'sidekiq', '~>5.2'
gem 'sidekiq', '~>6'
# Light weight job scheduling extension for Sidekiq (https://moove-it.github.io/sidekiq-scheduler/)
gem 'sidekiq-scheduler'
# Run any kind of code in parallel processes (https://github.com/grosser/parallel)
# gem 'parallel'

##==============notifications
# Ruby wrapper for Telegram's Bot API (https://github.com/atipugin/telegram-bot)
gem 'telegram-bot-ruby'

group :development do
  ##===========code reloading
  # problems: JRuby&Windows-(Shogun uses fork()), better_errors gem, NewRelic
  # Reloading Rack development server (https://github.com/rtomayko/shotgun)
  # gem 'shotgun', platforms: :ruby
  # Hanami reloader (http://hanamirb.org)
  gem 'hanami-reloader'
  # Hanami webconsole (http://hanamirb.org)
  gem 'hanami-webconsole'
end

group :test, :development do
  # Loads environment variables from `.env`. (https://github.com/bkeepers/dotenv)
  gem 'dotenv', '~> 2.7'

  ##==data gen-tion & cleanup
  # Strategies for cleaning databases.  Can be used to ensure a clean state for testing. (http://github.com/DatabaseCleaner/database_cleaner)
  gem 'database_cleaner', '~> 1.99'
  # Fabrication for Hanami (https://github.com/jodosha/hanami-fabrication)
  gem 'hanami-fabrication'

  ##==============style check
  # Automatic Ruby code style checking tool. (https://github.com/rubocop-hq/rubocop)
  gem 'rubocop', require: false
  # Automatic performance checking tool for Ruby code. (https://github.com/rubocop-hq/rubocop-performance)
  gem 'rubocop-performance', require: false
  # Code style checking for RSpec files (https://github.com/rubocop-hq/rubocop-rspec)
  gem 'rubocop-rspec', '~> 1.44', require: false

  ##=========mutation testing
  # Rspec integration for mutant (https://github.com/mbj/mutant)
  gem 'mutant-rspec'
end

group :test do
  # Capybara aims to simplify the process of integration testing Rack applications (https://github.com/teamcapybara/capybara)
  gem 'capybara'
  # Nokogiri is an HTML, XML, SAX, and Reader parser
  gem 'nokogiri', '~> 1.13.8'
  # rspec-3.8.0 (http://github.com/rspec)
  gem 'rspec'
  # RSpec Matchers for Hanami (https://github.com/davydovanton/rspec-hanami)
  gem 'rspec-hanami'
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test
  #  suites (http://github.com/colszowka/simplecov)
  gem 'simplecov', require: false
  # JSON formatter for SimpleCov code coverage tool for ruby 1.9+ (https://github.com/vicentllongo/simplecov-json)
  gem 'simplecov-json', require: false
end
