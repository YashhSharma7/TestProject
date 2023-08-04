Rails.application.routes.draw do 
  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self) 
  
  #get 'homes/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # devise_for :users, controllers: {
  #   registrations: 'registrations'
  # }
  root to: "homes#index"
  get '/search', to: 'homes#search', as: 'search'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   
end
