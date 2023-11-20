class ListTask < ApplicationRecord
  validates :name, presence: true

  belongs_to :board_list
  has_many :task_users, dependent: :destroy
end
