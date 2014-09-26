class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_hostname
  protect_from_forgery with: :null_session

  def set_hostname
  	@hostname = request.host
  end
end