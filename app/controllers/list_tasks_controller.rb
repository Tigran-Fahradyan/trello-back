class ListTasksController < ApplicationController
  before_action :get_board
  before_action :get_board_list

  def index
    render json: @board_list.list_tasks.select(:id, :name, :board_list_id)
  end

  def create
    list_task = @board_list.list_tasks.create!(list_task_create_params)
    render json: list_task.slice(:id, :name, :board_list_id, :description), status: :created
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def update
    list_task = @board_list.list_tasks.find params[:id]
    list_task.update(list_task_update_params)
    render json: list_task.slice(:id, :name, :board_list_id, :description), status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def show
    list_task = @board_list.list_tasks.where(id: params[:id]).select(:id, :name, :board_list_id).first
    raise ActiveRecord::RecordNotFound, "Record not found" if list_task.blank?
    render json: list_task
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def destroy
    list_task = @board_list.list_tasks.find params[:id]
    list_task.destroy
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  private

  def list_task_create_params
    params.require(:list_task).permit!
  end

  def list_task_update_params
    params.require(:list_task).permit!
  end

  def get_board
    @board = Board.find params[:board_id]
  end

  def get_board_list
    @board_list = @board.board_lists.find params[:board_list_id]
  end
end