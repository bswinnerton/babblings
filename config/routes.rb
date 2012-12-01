BabblinGs::Application.routes.draw do
  resources :posts
  match "/help/:module" => "help#index"
end
