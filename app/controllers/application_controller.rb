class ApplicationController < ActionController::Base
  before_action :authenticate_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_401

  def render_401
    head 401
  end

  def authenticate_user

  end

end
