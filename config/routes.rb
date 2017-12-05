Rails.application.routes.draw do

  apipie
  namespace :api do
    namespace :v1 do
      resources :user_tokens, only: [:create] # Login
      resources :users, only: [:create]
      resources :geo_tracks, only: [:create]
      resources :user_geo_tracks, only: [:index]
      resources :user_permissions, only: [:create, :destroy]
      resources :user_profiles, only: [:create, :show]
      resources :user_sensors, only: [:create, :destroy, :index]

      resources :sensors, only: [] do
        resource :ec_numbers, only: [:update, :show]
        resource :remote_listening, only: [:create]
      end
    end
  end

  root to: 'logins#index' # Where we mount the react app for now
  get '*path', to: 'logins#index'
end
