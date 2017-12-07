Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "devise/omniauth_callbacks" }
  root 'routes#index', as: 'routes'

  get '/auth/:provider/callback' => 'devise/sessions#createWithOmni'
 
  resources :routes do 

  
      resources :users 
      resources :stops
  end

  resources :users
  resources :stops , only:[:show,:update,:create,:delete,:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
