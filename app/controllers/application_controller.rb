class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permitir 'username' durante el registro
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :biography, :facebook, :x, :instagram])

    # Permitir 'username' durante la actualización de la cuenta
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :biography, :facebook, :x, :instagram])
  end

  def after_sign_up_path_for(resource)
    edit_profile_path
  end
end
