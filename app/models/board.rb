class Board < ApplicationRecord
  belongs_to :user, optional: true
  has_many :board_lists, dependent: :destroy
  has_many :board_users, dependent: :destroy

  after_commit :generate_default_lists, on: :create

  private

  def generate_default_lists
    ["To Do", "In progress", "Done"].each do |list_name|
      self.board_lists.create!(name: list_name)
    end
  end
end
