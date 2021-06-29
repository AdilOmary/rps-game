class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.integer :move
      t.integer :bot_move

      t.timestamps
    end
  end
end
