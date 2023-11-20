class CreateListTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :list_tasks do |t|
      t.references :board_list, foreign_key: true
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
