class ListTask < ApplicationRecord
  validates :name, presence: true

  belongs_to :board_list
  has_many :task_users, dependent: :destroy
  has_many :users, through: :task_users
end
