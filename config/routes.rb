Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :user_tokens, only: [:create]
      resources :users, only: [:create]
      resources :geo_tracks, only: [:create]
      resources :user_geo_tracks, only: [:index]
      resources :packages, only: [:index]
    end
  end

  root to: 'logins#index' # Where we mount the react app for now
  get '*path', to: 'logins#index'
end
