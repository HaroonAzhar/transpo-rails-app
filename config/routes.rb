Rails.application.routes.draw do
  devise_for :users
  root 'routes#index'

  
 
  resources :routes do 

  
      resources :users 
      resources :stops
  end

  resources :stops do 

  
      resources :users 
      
  end
  resources :users

 
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
