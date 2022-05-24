# frozen_string_literal: true

module Api
  module V1
    module Users
      # Register a new user
      class RegistrationController < Devise::RegistrationsController
        include AuthenticationHelper

        before_action :authenticate_api
        def create
          build_resource(sign_up_params)
          if resource.save
            render json: { meta: { code: I18n.t('response_status.success'), user: resource } }
          else
            render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                                   message: Errors.customize(resource.errors).join(', ') } }
          end
        rescue StandardError => e
          render json: { meta: { code: I18n.t('response_status.unprocessible_entity'), message: e.message } }
        end

        private

        def sign_up_params
          params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
          )
        end
      end
    end
  end
end
