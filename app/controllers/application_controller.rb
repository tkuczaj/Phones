class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  private 

  def require_user_logged_in!
    redirect_to root_path, alert: "Tylko dla zalogowanych użytkowników." if Current.user.nil?
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end
