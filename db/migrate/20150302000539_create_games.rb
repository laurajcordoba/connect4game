class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :player_one_id
      t.integer :player_two_id

      t.timestamps
    end
  end
end
