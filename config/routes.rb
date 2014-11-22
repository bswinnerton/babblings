require 'sidekiq/web'

Rails.application.routes.draw do
  root 'posts#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:index, :show]
      resources :pictures, controller: :posts, only: [:index, :show], type: 'Picture'
      resources :quotes, controller: :posts, only: [:index, :show], type: 'Quote'
      resources :spotify, controller: :posts, only: [:index, :show], type: 'Spotify'
      resources :vimeo, controller: :posts, only: [:index, :show], type: 'Vimeo'
      resources :youtube, controller: :posts, only: [:index, :show], type: 'Youtube'
    end
  end

  resources :posts do
    collection { get '/page/:page' => 'posts#page' }
  end
  resources :pictures, controller: :posts, type: 'Picture'
  resources :quotes, controller: :posts, type: 'Quote'
  resources :spotify, controller: :posts, type: 'Spotify'
  resources :vimeo, controller: :posts, type: 'Vimeo'
  resources :youtube, controller: :posts, type: 'Youtube'

  mount Sidekiq::Web => '/sidekiq'
end
