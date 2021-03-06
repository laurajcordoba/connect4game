class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # == Helper methods
  helper_method :current_board

  # == Public methods
  def current_board
    return unless session[:board]
    @current_board ||= session[:board]
  end

  def initialize_board
    @board = Array.new(6) { Array.new(7, nil) }

    session[:board] = @board
  end

end
