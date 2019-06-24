# frozen_string_literal: true

module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def company_text(vacancy)
        if vacancy.contact.site
          html.a(
            vacancy.contact.company,
            href: add_url_schema(vacancy.contact.site),
            target: '_blank',
            rel: 'nofollow noopener'
          )
        else
          vacancy.contact.company
        end
      end

      def remote_badge(vacancy)
        return unless vacancy.remote_available

        html.span(class: 'mr-2 badge badge-success') { 'Удаленная работа' }
      end

      def position_type_badge(vacancy)
        html.span(class: 'mr-2 badge badge-info') { POSITION_TYPE_VALUES[vacancy.position_type] }
      end

      def vacancy_salary_information(vacancy)
        currency = CURRENCY_VALUES[vacancy.salary_currency]
        unit = UNIT_VALUES[vacancy.salary_unit]

        html.span(class: 'salary') do
          text 'от '
          span(class: 'money') { vacancy.salary_min }
          text ' до '
          span(class: 'money') { vacancy.salary_max }
          text " #{currency} #{unit}"
        end
      end

      POSITION_TYPE_VALUES = {
        'full_time' => 'Полная занятость',
        'part_time' => 'Частичная занятость',
        'contractor' => 'Работа по контракту',
        'intern' => 'Интернатура',
        'temp' => 'Временная работа',
        'other' => 'Другое'
      }.freeze

      CURRENCY_VALUES = { 'rub' => 'рублей', 'usd' => 'долларов', 'eur' => 'евро' }.freeze

      UNIT_VALUES = {
        'monthly' => 'в месяц',
        'yearly' => 'в год',
        'by hour' => 'в час',
        'per project' => 'за проект'
      }.freeze
    end
  end
end
