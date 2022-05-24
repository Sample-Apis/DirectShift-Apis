# frozen_string_literal: true

# Define methods for authoriation
module AuthenticationHelper
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_api
    api_token = Rails.application.credentials.dig(:development, :api_token)
    authenticate_or_request_with_http_token do |token, _options|
      if token == api_token
        @current_user = {}
      else
        render json: { meta: { code: I18n.t('response_status.authentication_error'),
                               errorDetail: I18n.t('response_message.authentication_error') } }
      end
    end
  end

  attr_reader :current_user
end
