Rails.application.routes.draw do
  devise_for :users
  root 'routes#index', as: 'routes'
  resources :routes do 

  
      resources :users 
      resources :stops
  end
  resources :stops

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
