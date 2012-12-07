Babblings::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts, :except => :destroy
  match "/posts/page/:page" => "posts#page"
  match "/help" => "help#index"
end
