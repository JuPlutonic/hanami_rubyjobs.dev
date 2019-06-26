# frozen_string_literal: true

module Web
  module Controllers
    module Vacancies
      class Show
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
          operation: 'vacancies.operations.show',
          analytics_operation: 'analytics.operations.increase_vacancy_view_count'
        ]

        expose :vacancy, :analytics

        def call(params)
          result = operation.call(id: params[:id])

          case result
          when Success
            @vacancy = result.value!
            @analytics = analytics_operation.call(vacancy_id: params[:id]).value_or(VacancyAnalytic.new)
          when Failure
            redirect_to routes.root_path
          end
        end
      end
    end
  end
end
