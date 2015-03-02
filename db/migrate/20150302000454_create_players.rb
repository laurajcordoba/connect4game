class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :color
      t.integer :game_id

      t.timestamps
    end
  end
end