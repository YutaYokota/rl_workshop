Rails.application.routes.draw do
  root to: 'home#index'
  resources :microposts,          only: [:index, :show, :create, :update, :destroy]
end
