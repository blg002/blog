Blog::Application.routes.draw do
  get 'sign_in' => 'sessions#new', :as => 'sign_in'
  get 'sign_out' => 'sessions#destroy', :as => 'sign_out'

  resources :articles
  resources :authors
  resources :sessions
    
  root :to => 'Articles#index'
end
