class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile])
    end
    
end
