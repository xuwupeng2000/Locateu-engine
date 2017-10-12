# User has encrypted profile just like its password digest. 
# There are two copies of the profile. One is protected by user password, another is protected by EC password
# At any given time, server can't known the profile, EC can't tell the geo tracks
# Only user have the ability to connect those two together
class User < ApplicationRecord
end
