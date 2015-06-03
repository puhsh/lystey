Rails.application.routes.draw do
  resources :agents, only: [:show]
end
