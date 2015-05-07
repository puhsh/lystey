Rails.application.routes.draw do

  resources :agents, only: [:show]
  get '/', to: 'agents#show', constraints: { subdomain: /.+/ }, as: :agent_root
end
