class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :status
    devise_parameter_sanitizer.for(:sign_up) << :status_date
    devise_parameter_sanitizer.for(:sign_up) << :address_id

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :status
    devise_parameter_sanitizer.for(:account_update) << :status_date
    devise_parameter_sanitizer.for(:account_update) << :address_id
  end

end
