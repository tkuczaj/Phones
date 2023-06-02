# frozen_string_literal: true

# Define workers controller
class WorkersController < ApplicationController
  before_action :require_user_logged_in!
  skip_before_action :require_user_logged_in!, only: [:index]

  def index
    if params[:search].blank?
      redirect_to root_path
    else
      @workers = Worker.search(params[:search])
    end
  end

  def show; end

  def new
    @worker = Worker.new
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def worker_params
    params.require(:worker).permit(:name, :group_id, :search)
  end
end
