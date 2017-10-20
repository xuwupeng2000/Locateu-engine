json.auth_token @auth_token
json.user do
  json.partial! 'shared/user', user: @user
end