class BoardUser < ApplicationRecord
  belongs_to :user
  belongs_to :board

  after_commit :remove_from_board_tasks, on: :destroy

  private

  def remove_from_board_tasks
    board = Board.find_by(id: self.board_id)
    if board.present?
      task_users = TaskUser.where(user_id: self.user_id, list_task_id: board.list_tasks.ids)
      task_users.destroy_all if task_users.present?
    end
  end
end
