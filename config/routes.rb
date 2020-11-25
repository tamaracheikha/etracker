Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :applications do
    resources :notes, only: [:create]
    resources :reminders, only:[:create, :update]
  end
  resources :notes, only: [:update, :destroy]
  resources :reminders, only:[:destroy]
end

