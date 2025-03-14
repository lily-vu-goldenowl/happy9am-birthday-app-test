require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :users, only: [:create, :update, :destroy]
end
