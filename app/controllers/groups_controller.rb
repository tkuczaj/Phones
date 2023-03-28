class GroupsController < ApplicationController
  before_action :require_user_logged_in!
  skip_before_action :require_user_logged_in!, only: [:index]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])    
    @group.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
