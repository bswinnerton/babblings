Babblings::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts, :except => :destroy
  match '/posts/page/:page' => 'posts#page'
	match '/posts/delete/:id' => 'posts#delete'
	match '/posts/undelete/:id' => 'posts#undelete'
	match '/posts/hide/:id' => 'posts#hide'
	match '/posts/unhide/:id' => 'posts#unhide'
  match '/help' => 'help#index'
end
