class Api::V1::UsersController < ApplicationController

	# Start an account with us, we only ask your username and a password, if you want you can leave an email
	# Note: without email your password can't be recovered
	# User have an account may not have a sensor, in order to user our server you will need:
	# - User account
	# - Sensor
	# - EC account
	def create
		@user = User.new(user_params)

		if @user.save
			render :created
		else
			render :error, status: 422
		end
	end

	private

	def user_params
		params.require(:user).permit(
			:username,
			:password,
			:password_confirmation,
			:email
		)
	end
end
