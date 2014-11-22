require 'sidekiq/web'

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    collection do
      get '/page/:page' => 'posts#page'
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:index, :show] do
        collection do
          get '/page/:page' => 'posts#page'
        end
      end
    end
  end

  resources :pictures, controller: :posts
  resources :quotes, controller: :posts
  resources :spotify, controller: :posts
  resources :vimeo, controller: :posts
  resources :youtube, controller: :posts

  mount Sidekiq::Web => '/sidekiq'
end
