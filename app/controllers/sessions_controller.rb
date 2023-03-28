class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(login: params[:login])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Zalogowano użytkownika systemu "+user.name
    else
      flash.now[:alert] = "Nieprawidłowa nazwa użytkownika lub hasło"
      render :new, status: 422
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Wylogowano użytkownika"
  end
end