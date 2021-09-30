# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?
      respond_to :json
      around_action :handle_exceptions

      protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_in, keys: %i[name email password])
        end

      private

        def handle_exceptions
          yield
        rescue ActiveRecord::RecordNotFound => e
          render json: { message: e }, status: :not_found
        rescue NoMethodError => e
          render json: { message: e }, status: :internal_server_error
        rescue ActiveRecord::RecordInvalid => e
          render json: { message: e }, status: :unprocessable_entity
        rescue Pundit::NotAuthorizedError => e
          render json: { message: e }, status: :forbidden
        rescue StandardError => e
          render json: { message: e }, status: :internal_server_error
        end
    end
  end
end