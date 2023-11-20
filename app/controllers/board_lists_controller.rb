class BoardListsController < ApplicationController
  before_action :get_board

  def index
    render json: @board.board_lists.select(:id, :name, :board_id)
  end

  def create
    board_list = @board.board_lists.create!(board_list_create_params)
    render json: board_list.slice(:id, :name), status: :created
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def update
    board_list = @board.board_lists.find params[:id]
    board_list.update(board_list_update_params)
    render json: board_list.slice(:id, :name), status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def show
    board_list = @board.board_lists.where(id: params[:id]).select(:id, :name, :board_id).first
    raise ActiveRecord::RecordNotFound, "Record not found" if board_list.blank?
    render json: board_list
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def destroy
    board_list = @board.board_lists.find params[:id]
    board_list.destroy
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  private

  def board_list_create_params
    params.require(:board_list).permit!
  end

  def board_list_update_params
    params.require(:board_list).permit!
  end

  def get_board
    @board = Board.find params[:board_id]
  end
end