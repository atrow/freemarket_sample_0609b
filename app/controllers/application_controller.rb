class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets.basic_auth_user && password == Rails.application.secrets.basic_auth_password
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, user_detail_attributes: [:prefecture_id, :zip_code, :city, :street, :building_name]])
  end
end
