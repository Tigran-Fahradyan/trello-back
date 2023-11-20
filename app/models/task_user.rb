class TaskUser < ApplicationRecord
  belongs_to :user
  belongs_to :list_task
end
