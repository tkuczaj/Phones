# frozen_string_literal: true

# Define phones controller
class PhonesController < ApplicationController
  before_action :require_user_logged_in!

  def index; end

  def show; end

  def new
    @worker = Worker.find(params[:worker_id])
    @phone = Phone.new
  end

  def edit
    @phone = Phone.find(params[:id])
    @worker = Worker.find(@phone.worker_id)
  end

  def create
    @worker = Worker.find(phone_params[:worker_id])
    @phone = Phone.create(phone_params)

    if @phone.save
      redirect_to edit_worker_path(@phone.worker_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @phone = Phone.find(params[:id])
    @worker = Worker.find(@phone.worker_id)

    if @phone.update(phone_params)
      redirect_to edit_worker_path(@phone.worker_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @phone = Phone.find(params[:id])
    @worker = Worker.find(@phone.worker_id)
    @phone.destroy

    redirect_to edit_worker_path(@phone.worker_id)
  end

  private

  def phone_params
    params.require(:phone).permit(:number, :worker_id)
  end
end
