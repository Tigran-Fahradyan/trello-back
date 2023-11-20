class Board < ApplicationRecord
  belongs_to :user, optional: true
  has_many :board_lists
  has_many :board_users
end
