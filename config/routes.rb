Rails.application.routes.draw do

  apipie
  namespace :api do
    namespace :v1 do
      resources :user_tokens, only: [:create] # Login
      resources :users, only: [:create]
      resources :geo_tracks, only: [:create]
      resources :user_tracks, only: [:index]
      resources :user_permissions, only: [:create, :destory]
      resources :user_profiles, only: [:create, :show]
      resources :user_sensors, only: [:create, :delete, :index]
    end
  end

  root to: 'welcome#index' # Where we mount the react app for now
end
