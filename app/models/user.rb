class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable, :timeoutable

  validates :full_name, presence: true

  has_many :board_users, dependent: :nullify
  has_many :task_users, dependent: :nullify
end
