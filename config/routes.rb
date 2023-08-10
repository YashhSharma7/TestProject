Rails.application.routes.draw do 

  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self) 
  
  devise_for :users, controllers: { confirmations: 'users/confirmations', 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations', sessions: 'users/sessions', sessions: 'sessions'
   }
  
  devise_scope :user do
    get 'users/confirmations/verify_otp'
    post 'users/confirmations/verify_otp'
    namespace :users do
      post 'verify_otp', to: 'sessions#verify_otp', as: 'verify_otp'
      end
  end


  root to: "homes#index"
  get '/homes', to: "homes#index"
  get '/search', to: 'homes#search', as: 'search'
   
end
