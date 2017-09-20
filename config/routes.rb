Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  root to: 'pages#home'
  resources :tickets, only: [:create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  get 'tickets/:id/take', to: 'tickets#take_ticket', as: "take_ticket"
end
