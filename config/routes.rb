Rails.application.routes.draw do
  root 'home#index'

  get '/dashboard' => 'dashboard#index'
  get '/purchase-ticket' => 'home#purchase'
  get '/purchase-ticket/new' => 'home#purchase'
  get '/purchase-ticket/returning' => 'home#purchase'
  get '/new-or-returning' => 'home#new_or_returning'
  get '/events' => 'event#index'
  get '/events/new' => 'event#new'
  get '/confirm' => 'home#confirm'

  namespace :api do
    resources :events, only: [:create, :index]
    resources :customer_purchases, only: [:create]
  end
end
