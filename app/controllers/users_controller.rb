class UsersController < ApplicationController

  def index
    render json: User.all.select(:id, :full_name, :email)
  end

  def create
    user = User.create!(user_create_params)
    render json: user.slice(:id, :full_name, :email), status: :created
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def update
    user = User.find params[:id]
    user.update(user_update_params)
    render json: user.slice(:id, :full_name, :email), status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def show
    user = User.where(id: params[:id]).select(:id, :full_name, :email).first
    raise ActiveRecord::RecordNotFound, "Record not found" if user.blank?
    render json: user
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  private

  def user_create_params
    params.require(:user).permit!
  end

  def user_update_params
    params.require(:user).permit!
  end

end