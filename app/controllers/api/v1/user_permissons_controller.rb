class Api::V1::UserPermissionsController < ApplicationController
  before_action :authenticate_user

	# User give its profile to EC(another user in our system)
	# Server will need user's password to decipher the profile, will need another password from EC to encrypted it again, then give it to the EC
	# This action will also give the permisson to the EC allow him to see the geo tracking information of user
	def create

	end

	# Remove the permission, EC then can no longer see the user's geo tracking information
	def destroy

	end

end
