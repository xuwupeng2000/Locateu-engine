class Api::V1::UserTokensController < ApplicationController
  before_action :authenticate_user

  # Where user can login and hold a token, whenever a request is made the token will be validate against
  def create
    @user, @auth_token = authenticate
    render :show, status: :created
  end

  private

  def authenticate
    user = User.find_by_username(auth_params[:username])

    token = if user && user.authenticate(auth_params[:password])
              auth_token(user)
            else
              raise Knock.not_found_exception_class
            end
    [ user, token ]
  end

  def auth_token(user)
    ::Knock::AuthToken.new(payload: user.to_token_payload)
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
