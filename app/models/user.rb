class User < ApplicationRecord
	# User has encrypted profile just like its password degist. There are two copies of the profile. One is saved on our app on the phone with another user(emergency contact EC), another saved on the server.
	# The one on the server is encrypted with user password, anohter is on EC's phone protected with EC's password.
	# At any given time, server can't known the profile, EC can't tell the geo tracks.
	# Only when user want to connect two parts of the infromation we can then see the full picture.
end
