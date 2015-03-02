class PlayersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def show
    @player = Player.find params[:id]
  end

end
