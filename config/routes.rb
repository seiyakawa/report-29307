Rails.application.routes.draw do
  devise_for :users
  root to: 'reports#index'
  resources :reports
  resources :users, only: :show

  post "/homes_guest_sign_in", to: "homes#new_guest"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end