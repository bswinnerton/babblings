Babblings::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts do
    member do
      put   'undelete'    => 'posts#undestroy'
      put   'hide'        => 'posts#hide'
      put   'unhide'      => 'posts#unhide'
    end
  end
  match '/posts/page/:page' => 'posts#page'
  match '/help' => 'help#index'
end
