Rails.application.routes.draw do
  resources :agents do
    resources :admin, only: [:index]
  end
end
