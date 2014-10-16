class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_hostname, :set_google_api_keys
  protect_from_forgery with: :null_session

  def set_hostname
  	@hostname = request.host
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end

  def set_google_api_keys
    @gcm_api_key = GCM_API_KEY
    @google_api_key = GOOGLE_API_KEY
  end
end