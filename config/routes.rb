require 'sidekiq/web'

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    collection do
      get '/page/:page' => 'posts#page'
    end
  end

  scope '/api/v1/', defaults: {format: :json} do
    get '/posts' => 'posts#index'
    get '/posts/page/:page' => 'posts#page'
    get '/posts/:id' => 'posts#show'
  end

  resources :pictures, controller: :posts
  resources :quotes, controller: :posts
  resources :spotify, controller: :posts
  resources :vimeo, controller: :posts
  resources :youtube, controller: :posts

  mount Sidekiq::Web => '/sidekiq'
end
