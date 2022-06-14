class ApplicationController < ActionController::Base
  #ユーザー認証が行われる前に、configure~が実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  #configure~を定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :age])
  end
end
