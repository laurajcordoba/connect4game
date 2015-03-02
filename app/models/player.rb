class Player < ActiveRecord::Base
  # == Constants
  COLOURS = [:red, :blue]

  # == Associations
  has_one :game

  # == Public instance methods
  def opponent
    (self == game.player_one) ? game.player_two : game.player_one
  end

  def set_coordinates(x, y, horizontal, vertical)
    x_aux = case horizontal
            when :right
              x +  1
            when :left
              x - 1
            else
              x
            end

    y_aux = case vertical
            when :up
              y + 1
            when :down
              y - 1
            else
              y
            end

    [x_aux, y_aux]
  end

  def count(x, y, horizontal, vertical, color, board)
    new_x, new_y = set_coordinates(x, y, horizontal, vertical)

    if new_x < 0 || new_x > 5 || new_y < 0 || new_y > 6 || board[new_x][new_y] != color
      return 0
    else
      return 1 + count(new_x, new_y, horizontal, vertical, color, board)
    end
  end

  def process_result(left, right, up, down, up_left, down_right, up_right, down_left)
    [left + right + 1, up + down + 1, up_left + down_right + 1, up_right + down_left + 1].max
  end

  def winner(board)
    (0..5).each do |x|
      (0..6).each do |y|
        color = board[x][y]
        next if color == nil

        left_count       = count(x, y, :left, nil, color, board)
        right_count      = count(x, y, :right, nil, color, board)
        up_count         = count(x, y, nil, :up, color, board)
        down_count       = count(x, y, nil, :down, color, board)
        up_left_count    = count(x, y, :left, :up, color, board)
        down_right_count = count(x, y, :right, :down, color, board)
        up_right_count   = count(x, y, :right, :up, color, board)
        down_left_count  = count(x, y, :left, :down, color, board)

        best_count = process_result(left_count, right_count, up_count, down_count, up_left_count, down_right_count, up_right_count, down_left_count)

        return color if best_count >= 4
      end
    end
    return nil
  end

end
