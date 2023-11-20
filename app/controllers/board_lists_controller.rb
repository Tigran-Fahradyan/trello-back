class BoardListsController < ApplicationController

  def index
    render json: BoardList.all.select(:id, :name)
  end

  def create
    board_list = BoardList.create!(board_list_create_params)
    render json: board_list.slice(:id, :name), status: :created
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  private

  def board_list_create_params
    params.require(:user).permit!
  end

end