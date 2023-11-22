class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable, :timeoutable

  validates :full_name, presence: true

  has_many :board_users, dependent: :destroy
  has_many :task_users, dependent: :destroy

  after_commit :generate_email, on: :create

  private

  def generate_email
    self.update_column(:email, Faker::Internet.email)
  end
end
