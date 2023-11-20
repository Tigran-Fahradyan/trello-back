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

  def show
    user = User.where(id: params[:id]).select(:id, :full_name, :email).first
    render json: user
  end

  private

  def user_create_params
    params.require(:user).permit!
  end

end