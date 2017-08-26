class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation]
    added_params = [:name, :email, :password, :password_confirmation, :image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attres 
    devise_parameter_sanitizer.permit :account_update, keys: assed_params  
  end
end
