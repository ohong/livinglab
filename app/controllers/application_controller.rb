class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # function to validate Full Name, invoked before any devise_controller action
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :fullname
      devise_parameter_sanitizer.for(:account_update) << :fullname
    end
end
