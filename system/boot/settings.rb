# frozen_string_literal: true

require 'dry/system/components'

Container.boot(:settings, from: :system) do
  settings do
    Types = Core::Types

    key :hamami_env_puma, Types::Coercible::String.default('development')
    key :port,            Types::Coercible::Int.optional
    key :threads_count,   Types::Coercible::Int.optional
    key :web_concurrency, Types::Coercible::Int.optional

    key :database_connection_validation_timeout, Types::Coercible::Int.optional # in seconds
    key :database_url, Types::String.constrained(filled: true)

    key :moderation_sessions_secret, Types::String.constrained(filled: true)
    key :web_sessions_secret,        Types::String.constrained(filled: true)

    key :logger_json_formatter, Types::String
    key :logger_level,          Types::LoggerLevel

    key :redistogo_url, Types::Coercible::String.default('')

    key :rollbar_key, Types::Coercible::String.default('')

    key :moderation_login,    Types::String.constrained(filled: true)
    key :moderation_password, Types::String.constrained(filled: true)

    key :telegram_bot_name,  Types::Coercible::String.default('')
    key :telegram_bot_token, Types::Coercible::String.default('')
  end
end
