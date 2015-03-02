class PlayersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :js, :html

  # == Before Actions
  before_action :set_board, only: [:show, :push]
  before_action :finihed_game, only: [:show, :push ]

  def show
    @player   = Player.find params[:id]
    @winner   = @player.winner(current_board)
    @finished = @winner.present? ? true : false
  end

  def push
    row       = params[:i].to_i
    column    = params[:j].to_i
    player    = Player.find(params[:player_id])
    @opponent = Game.first.opponent(player)

    current_board[row][column] = player.color
  end

  def set_board
    @board = current_board
  end

  def finihed_game
    @finished = Game.fully?(current_board)
  end

end
