class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << [:name, :email]
  end

  def authenticate_admin!
    if current_user && current_user.admin?
      # fine
    else
      redirect_to new_user_session_path
    end
  end
end
