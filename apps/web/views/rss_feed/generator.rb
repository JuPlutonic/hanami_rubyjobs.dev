# frozen_string_literal: true

require 'rss'
require 'hanami/helpers/escape_helper'

module Web
  module Views
    module RssFeed
      class Generator
        include Hanami::Helpers::EscapeHelper

        attr_reader :current_time

        def initialize(current_time: -> { Time.now })
          @current_time = current_time
        end
        def call(vacancies)
          rss = RSS::Maker.make('atom') do |maker|
            maker.channel.author = 'RubyJobs.Net'
            maker.channel.updated = current_time.call
            maker.channel.about = 'https://rubyjobs.dev/feeds.rss'
            maker.channel.title = 'Ruby Jobs RSS Feed'

            vacancies.each do |vacancy|
              maker.items.new_item do |item|
                item.link = "https://rubyjobs.dev/vacancies/#{vacancy.id}"
                item.title = vacancy.position
                item.updated = vacancy.updated_at.to_s
                item.description = vacancy.details
              end
            end
          end
          # rubocop:denable Metrics/LineLength, Metrics/AbsLength
          raw(rss.to_s)
        end
      end
    end
  end
end
