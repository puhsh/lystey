Rails.application.routes.draw do

  resources :agents, only: [:show]
  get '/:id', to: redirect('/agents/%{id}'), contraints: AgentsController.new

end
