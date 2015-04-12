Rails.application.routes.draw do
  root to: 'home#index'

  # Internal API routes
  namespace :api do
    resources :realtors, only: [:show, :index]
  end

end
