# frozen_string_literal: true

module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :config_params, if: :devise_controller?
  end

  def config_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username location description avatar])
  end
end
