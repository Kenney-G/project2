class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :game_title
      t.string :game_console
      t.text :game_desc
      t.integer :author_id
      t.timestamps null: false
    end
  end
end
