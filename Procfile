release: bundle exec hanami db migrate && bundle exec hanami assets precompile
web: bundle exec puma -t 5:5 -p ${PORT:-2300} -e ${HAMAMI_ENV:-development}
worker: bundle exec sidekiq -r ./config/boot.rb -c 7
