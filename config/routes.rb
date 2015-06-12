Rails.application.routes.draw do
  root to: 'home#index'

  resources :agents, only: [:show, :edit, :update] do
    resources :brokers
  end
end
