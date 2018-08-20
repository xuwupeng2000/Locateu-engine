class Api::V1::UserTokensController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_access

  # Where user can login and hold a token, whenever a request is made the token will be validate against
  def create
    @user, @auth_token = authenticate
    render jsonapi: @user, meda: {jwt: @auth_token}
  end

  private

  def authenticate
    user = User.find_by_username(auth_params[:username])

    token = if user && user.authenticate(auth_params[:password])
              auth_token(user)
            else
              raise Knock.not_found_exception_class
            end
    [user, token]
  end

  def invalid_access
    render :not_found, status: 401
  end

  def auth_token(user)
    ::Knock::AuthToken.new(payload: user.to_token_payload)
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
