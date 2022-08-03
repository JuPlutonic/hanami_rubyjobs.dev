# frozen_string_literal: true

Container.boot(:rollbar) do |container|
  init do
    require 'rollbar'

    use :settings

    Rollbar.configure do |config|
      config.disable_rack_monkey_patch = true
      config.access_token = container[:settings].rollbar_key
    end

    # Rollbar.info('new')

    container.register(:rollbar, Rollbar)
  end
end
