Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :medication_orders, only: [ :new, :create, :show, :index ]

  resources :donations, only: %i[new create index show]
end
