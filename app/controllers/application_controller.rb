class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

    def after_sign_in_path_for(resource)
     dashboard_path
    end



protected

def layout_by_resource
  if devise_controller? && resource_name == :user && action_name == "edit"
    "dashboard"
  else
    "application"
  end
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :last_name, :role, :state_id, :city_id, :age, :genre_id, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name, :role, :state_id, :city_id, :age, :genre_id, :email, :password, :password_confirmation, :current_password) }
  end

end
