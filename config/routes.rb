Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :applications do
    resources :notes, except: [:show, :new, :edit, :update, :destroy]
    resources :status_updates, except: [:show, :destroy]
  end
  resources :notes, only: [:edit, :update, :destroy]
  resources :status_updates, only: [:destroy]
end

