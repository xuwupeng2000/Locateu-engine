class Api::V1::UserTokensController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_401

  def create
    @user, @auth_token = authenticate
    render jsonapi: @user, expose: { jwt: @auth_token.token }
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

  def auth_token(user)
    ::Knock::AuthToken.new(payload: user.to_token_payload)
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
