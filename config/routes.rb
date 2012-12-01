BabblinGs::Application.routes.draw do
  resources :posts
  match "/help" => "help#index"
end
