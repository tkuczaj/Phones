class UsersController < ApplicationController
  before_action :require_user_logged_in!
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Dodano użytkownika systemu @user.name"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:login, :email, :name, :password, :password_confirmation)
    end
end
