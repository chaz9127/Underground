Rails.application.routes.draw do
  root 'home#index'

  get 'dashboard/index'
  get '/purchase-ticket' => 'home#purchase'
  get '/new-or-returning' => 'home#new_or_returning'
end
