class Player < ActiveRecord::Base
  # == Constants
  COLOURS = [:red, :blue]

  # == Associations
  has_one :game
end
