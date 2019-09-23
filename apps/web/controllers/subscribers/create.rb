# frozen_string_literal: true

module Web
  module Controllers
    module Subscribers
      class Create
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
          operation: 'subscribers.operations.create'
        ]

        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        def call(params)
          result = operation.call(email: params[:subscriber][:email])

          case result
          when Success
            flash[:success] = "#{result.value!.email} успешно добавлен в рассылку."
            redirect_to routes.root_path
          when Failure { |error| error.is_a?(Hanami::Model::UniqueConstraintViolationError) }
            flash[:error] = 'Произошла ошибка! Попробуйте позже, или используйте другой почтовый адрес.'
            redirect_to routes.root_path
          when Failure
            flash[:error] = "Не валидная почта \"#{params[:subscriber][:email]}\"."
            redirect_to routes.root_path
          end
        end
        # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
      end
    end
  end
end
