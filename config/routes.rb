require 'sidekiq/web'

Rails.application.routes.draw do
  root 'posts#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:index, :show]
      resources :pictures, controller: :posts, only: [:index, :show], type: 'Picture'
      resources :quotes, controller: :posts, only: [:index, :show], type: 'Quote'
      resources :spotifys, controller: :posts, only: [:index, :show], type: 'Spotify'
      resources :vimeos, controller: :posts, only: [:index, :show], type: 'Vimeo'
      resources :youtubes, controller: :posts, only: [:index, :show], type: 'Youtube'
    end
  end

  resources :posts do
    collection { get '/page/:page' => 'posts#page' }
  end
  resources :pictures, controller: :posts, type: 'Picture'
  resources :quotes, controller: :posts, type: 'Quote'
  resources :spotifys, controller: :posts, type: 'Spotify'
  resources :vimeos, controller: :posts, type: 'Vimeo'
  resources :youtubes, controller: :posts, type: 'Youtube'

  mount Sidekiq::Web => '/sidekiq'
end
