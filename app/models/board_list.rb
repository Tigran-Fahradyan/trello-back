class BoardList < ApplicationRecord
  validates :name, presence: true

  belongs_to :board
  has_many :list_tasks, dependent: :destroy
end
