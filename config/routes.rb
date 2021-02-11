Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  root to:'home#index'
  get '/team', to:'home#team'
  get '/contact', to:'home#contact'
  get '/welcome(/:name)', to:'home#index'
  resources :gossips do 
    resources :comments 
    resources :likes
  end
  resources :users  
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

  
end
