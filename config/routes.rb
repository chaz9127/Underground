Rails.application.routes.draw do
  root 'home#index'

  get 'dashboard/index'
  get '/purchase-ticket'
end
