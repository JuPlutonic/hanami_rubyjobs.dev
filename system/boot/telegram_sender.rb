# frozen_string_literal: true

require 'telegram/bot'

class TelegramSender

  attr_reader :bot, :logger

  def initialize(token:, logger:)
    @bot = Telegram::Bot::Client.new(token, logger: logger)
  end

  def call(chat_id, message)
    bot.api.send_message(chat_id: chat_id, text: message)
  end
end

Container.boot(:telegram_sender) do |container|
  use :logger

  init do
    logger.debug('Working with telegram bot tg://', ENV.fetch('TELEGRAM_BOT_NAME', ''))
    sender = TelegramSender.new(token: ENV.fetch('TELEGRAM_BOT_TOKEN', ''), logger: container['logger'])
    container.register('libs.telegram_sender', sender)
  end
end
