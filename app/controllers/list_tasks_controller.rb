class ListTasksController < ApplicationController
  before_action :get_board
  before_action :get_board_list
  before_action :get_list_task, only: [:assign_user, :unassign_user, :users]

  def index
    render json: @board_list.list_tasks.select(:id, :name, :board_list_id, :description)
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

  def assign_user
    raise ActiveRecord::RecordNotFound, "Task not found" if @list_task.blank?
    user = User.where(id: assign_user_params[:user_id]).select(:id, :full_name, :email).first
    raise ActiveRecord::RecordNotFound, "User not found" if user.blank?
    @board.board_users.find_or_create_by!(user_id: user.id)
    task_user = @list_task.task_users.find_or_create_by!(user_id: user.id)
    render json: task_user
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def unassign_user
    raise ActiveRecord::RecordNotFound, "Task not found" if @list_task.blank?
    user = User.where(id: assign_user_params[:user_id]).select(:id, :full_name, :email).first
    raise ActiveRecord::RecordNotFound, "User not found" if user.blank?
    task_user = @list_task.task_users.find_by(user_id: user.id)
    task_user.destroy if task_user.present?
    render json: {}, status: :ok
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def users
    render json: @list_task.users.select(:id, :full_name, :email)
  end

  private

  def list_task_create_params
    params.require(:list_task).permit!
  end

  def list_task_update_params
    params.require(:list_task).permit!
  end

  def assign_user_params
    params.require(:task_user).permit!
  end

  def get_board
    @board = Board.find params[:board_id]
  end

  def get_board_list
    @board_list = @board.board_lists.find params[:board_list_id]
  rescue
    render json: {error: $!.message}, status: :bad_request
  end

  def get_list_task
    @list_task = @board_list.list_tasks.find params[:id]
  end
end