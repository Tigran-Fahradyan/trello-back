class BoardsController < ApplicationController

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

  private

  def board_create_params
    params.require(:board).permit!
  end

  def board_update_params
    params.require(:board).permit!
  end

end