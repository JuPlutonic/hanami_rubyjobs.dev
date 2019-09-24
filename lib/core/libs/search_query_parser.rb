# frozen_string_literal: true

require 'strscan'

module Libs
  class SearchQueryParser
    OPTION_TOKEN = /\w+:\w+/.freeze
    SPACE_TOKEN = /\s/.freeze

    SEPARATOR_CHAR = ':'

    def call(query)
      scanner = StringScanner.new(query.to_s)
      options = scan_options(scanner)
      text = scanner.scan(/.+/)
      { text: text, **options }
    end

    private

    def scan_options(scanner, options = {})
      scanner.scan(SPACE_TOKEN)

      # rubocop:disable Lint/AssignmentInCondition
      while token = scanner.scan(OPTION_TOKEN)
        process_option_token(options, token)
        scanner.scan(SPACE_TOKEN)
      end
      # rubocop:enable Lint/AssignmentInCondition

      options
    end

    def process_option_token(options, token)
      node, value = token.split(SEPARATOR_CHAR)

      options[node.to_sym] = if options[node.to_sym]
                               Array(options[node.to_sym]) << value
                             else
                               value
                             end
    end
  end
end
