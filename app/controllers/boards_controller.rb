class BoardsController < ApplicationController

  before_action :get_board, only: [:assign_user, :unassign_user, :users]

  def index
    render json: Board.all.select(:id, :name)
  end

  def create
    board = Board.create!(board_create_params)
    render json: board.slice(:id, :name), status: :created
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def update
    board = Board.find params[:id]
    board.update(board_update_params)
    render json: board.slice(:id, :name), status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def show
    board = Board.where(id: params[:id]).select(:id, :name).first
    raise ActiveRecord::RecordNotFound, "Record not found" if board.blank?
    render json: board
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def destroy
    board = Board.find params[:id]
    board.destroy
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def assign_user
    raise ActiveRecord::RecordNotFound, "Board not found" if @board.blank?
    user = User.where(id: assign_user_params[:user_id]).select(:id, :full_name, :email).first
    raise ActiveRecord::RecordNotFound, "User not found" if user.blank?
    board_user = @board.board_users.find_or_create_by!(user_id: user.id)
    render json: board_user
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def unassign_user
    raise ActiveRecord::RecordNotFound, "Board not found" if @board.blank?
    user = User.where(id: assign_user_params[:user_id]).select(:id, :full_name, :email).first
    raise ActiveRecord::RecordNotFound, "User not found" if user.blank?
    board_user = @board.board_users.find_by(user_id: user.id)
    board_user.destroy if board_user.present?
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def users
    render json: @board.users.select(:id, :full_name, :email)
  end

  private

  def board_create_params
    params.require(:board).permit!
  end

  def board_update_params
    params.require(:board).permit!
  end

  def assign_user_params
    params.require(:board_user).permit!
  end

  def get_board
    @board = Board.find_by_id(params[:id])
  end

end