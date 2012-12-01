BabblinGs::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts
  match "/help" => "help#index"
end
