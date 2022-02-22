class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :phone_number])
  end
end
