# frozen_string_literal: true

class VacancyAnalyticRepository < Hanami::Repository
  associations do
    belongs_to :vacancy
  end
  def increase_view_count(vacancy_id)
    transaction do
      vacancy_analytics = root.where(vacancy_id: vacancy_id).one
      if vacancy_analytics
        update(vacancy_analytics.id, view_count: vacancy_analytics.view_count + 1)
      else
        create(vacancy_id: vacancy_id, view_count: 1)
      end
    end
  end
end
