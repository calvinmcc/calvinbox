class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def check_admin
    if current_user.role != "admin"
      redirect_to root_path, notice: "Nope! No cheating!" and return
    end
  end
end
