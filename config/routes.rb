Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  devise_for :users
  resources :scrappies
  resources :searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "scrappies#index"
end