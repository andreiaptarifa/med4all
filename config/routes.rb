Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :medication_order, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
