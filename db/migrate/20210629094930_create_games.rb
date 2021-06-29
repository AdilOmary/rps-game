class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.string :move
      t.string :bot_move

      t.timestamps
    end
  end
end
