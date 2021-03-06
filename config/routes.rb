Rails.application.routes.draw do
  
  get 'products/new'

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'cart'    => 'cart#index' # used this instead of:  get 'cart/index' so can use rails routes (see Hartl ch5)
  resources :users
  resources :products
end