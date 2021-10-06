Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :quotations
  resources :users
  root to: 'welcome#index'
  
  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do
      resources :quotations
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/auth/sessions'
      }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
