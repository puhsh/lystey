Rails.application.routes.draw do
  root to: 'home#index'

  resources :agents do
    resources :admin, only: [:index]
  end
end
