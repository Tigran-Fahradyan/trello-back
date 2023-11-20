class CreateTaskUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :task_users do |t|
      t.references :list_task, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
