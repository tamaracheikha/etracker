Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :applications do
    resources :notes, only: [:create]
    resources :reminders, only:[:create]
  end
  post "/extension", to: "applications#extension"
  resources :notes, only: [:edit, :update, :destroy]
  resources :reminders, only:[:destroy, :update, :create]
end

