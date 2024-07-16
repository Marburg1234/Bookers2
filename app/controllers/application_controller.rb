class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?



#とりあえずhome画面に設定した→本当はユーザーの詳細ページに設定しなおす
def after_sign_in_path_for(resource)
  books_path
end

# サインアウト後の遷移先設定→動作済み！
def after_sign_out_path_for(resource)
  root_path
end




  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
