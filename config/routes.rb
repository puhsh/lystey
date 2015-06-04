Rails.application.routes.draw do
  resources :agents, only: [:show] do
    resources :admin, only: [:index]
  end
end
