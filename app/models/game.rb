class Game < ActiveRecord::Base

  # == Associations
  belongs_to :player_one, foreign_key: "player_one_id", class_name: "Player"
  belongs_to :player_two, foreign_key: "player_two_id", class_name: "Player"

  # == Validations
  validates :player_one_id, :player_two_id, presence: true

end
