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

  def show
    board = Board.where(id: params[:id]).select(:id, :name).first
    render json: board
  end

  private

  def board_create_params
    params.require(:user).permit!
  end

end