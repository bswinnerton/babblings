Babblings::Application.routes.draw do
  root 'posts#index'
  get 'about' => 'static#about'
  post 'set_browser_dimensions' => 'house_cleaning#set_browser_dimensions'
  resources :posts do
    get 'page/:page' => 'posts#page', on: :collection, as: :page
  end
end
