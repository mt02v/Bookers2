class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:top, :about, :sign_up, :sign_in]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resourse)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

    protected
    def configurere_permitted_parameters    
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end