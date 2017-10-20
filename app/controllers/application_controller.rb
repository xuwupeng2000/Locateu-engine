class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def render_401
    head 401
  end

  def current_user
    @current_user ||= User.from_token_payload(
      ::Knock::AuthToken.new(token: token_from_request_headers).payload
    )
  rescue JWT::DecodeError => e
    head 401, json: {exception: e.message}
  end
  helper_method :current_user

  def authenticate_user
    head 401 unless current_user
  end

  def not_found(exception)
    head 404, json: {exception: exception.message}
  end

  def bad_request(exception)
    Raygun.track_exception(exception)
  end

  def unauthorized_token(exception)
    head 401, json: {error: 'Unauthorized token'}
  end

  def expried_token(exception)
    head 401, json: {error: 'Expired token'}
  end

  private

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

end
