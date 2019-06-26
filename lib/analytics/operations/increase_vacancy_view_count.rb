# frozen_string_literal: true

module Analytics
  module Operations
    class IncreaseVacancyViewCount < ::Libs::Operation
      include Import[
        vacancy_analytic_repo: 'reositories.vacancy_analytic'
      ]

      def call(vacancy_id:)
        Success(
          vacancy_analytic_repo.increase_view_count(vacancy_id)
        )
      end
    end
  end
end
