Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  get 'users/:id', to: 'profile#index', as: :profile
end
