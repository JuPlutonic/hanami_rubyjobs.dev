# frozen_string_literal: true

module Vacancies
  module Operations
    class List < ::Libs::Operation
      include Import[
        vacancy_query: 'queries.vacancy'
      ]

      PAGINATION_LIMIT = 10

      # rubocop:disable Lint/UnusedMethodArgument
      def call(search_query: {}, page: 1)
        pager = vacancy_query.pager_for_all_with_contact(limit: PAGINATION_LIMIT, page: page || 1)
        result = vacancy_query.all_with_contact(limit: PAGINATION_LIMIT, page: page || 1)

        Success(result: result, pager: pager)
      end
      # rubocop:enable Lint/UnusedMethodArgument
    end
  end
end
