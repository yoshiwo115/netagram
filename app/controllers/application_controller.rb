class ApplicationController < ActionController::Base
  #userがアクセスする前に実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private #コントローラーの中でしか呼び出さないように
  def configure_permitted_parameters
    #sign_upのときにusernameをkeyとして使用するのを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
