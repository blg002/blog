Blog::Application.routes.draw do
  resources :articles
  resources :users
    
  root :to => 'Articles#index'
end
