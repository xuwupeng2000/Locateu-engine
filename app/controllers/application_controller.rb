class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_401
  
  def render_401
    head 401
  end

end
