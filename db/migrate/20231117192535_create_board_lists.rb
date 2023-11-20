class CreateBoardLists < ActiveRecord::Migration[7.0]
  def change
    create_table :board_lists do |t|
      t.references :board, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
