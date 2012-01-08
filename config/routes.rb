Blog::Application.routes.draw do
  get 'sign-in' => 'sessions#new', as: 'sign_in'
  get 'sign-out' => 'sessions#destroy', as: 'sign_out'

  resources :articles
  resources :authors
  resources :sessions
  resources :categories
    
  root :to => 'Articles#index'
end
