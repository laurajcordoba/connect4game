class Game < ActiveRecord::Base

  # == Associations
  belongs_to :player_one, foreign_key: "player_one_id", class_name: "Player"
  belongs_to :player_two, foreign_key: "player_two_id", class_name: "Player"

  # == Validations
  validates :player_one_id, :player_two_id, presence: true

  # == Public instance methods
  def opponent(player)
    (player == player_one) ? player_two : player_one
  end

  # == Check if the board is fully
  def self.fully?(board)
    result = []

    board.each do |row|
     result << (row.all? &:nil?)
    end

    !result.all?
  end

end
