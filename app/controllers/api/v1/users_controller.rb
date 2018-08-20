class Api::V1::UsersController < ApplicationController
  def create
    attrs = user_params.reject{ |_key, value| value.blank? }
    @user = User.new(attrs)

    if @user.save
      render jsonapi: @user
    else
      render jsonapi_errors: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :name,
      :password,
      :email
    )
  end
end
