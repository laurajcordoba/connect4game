class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def initialize_board
    @board = Array.new(6) { Array.new(7, nil) }

    session[:board] = @board
  end

end
