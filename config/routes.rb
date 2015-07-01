Rails.application.routes.draw do
  root to: 'home#index'

  resources :agents, only: [:show, :edit, :update] do
    get '/guides/edit', to: 'agents#guides', as: 'edit_guides'
    get '/brokers/edit', to: 'brokers#edit', as: 'edit_brokers'
    get '/links/edit', to: 'agents#links', as: 'edit_links'
    get '/testimonials/edit', to: 'agents#testimonials', as: 'edit_testimonials'
    get '/graphics/edit', to: 'themes#edit', as: 'edit_themes'
    get '/about/edit', to: 'biographies#edit', as: 'edit_biography'
    get '/team/edit', to: 'teams#edit', as: 'edit_team'

    resources :brokers, except: [:edit]
    resources :guides, only: [:index]
    resources :testimonials, only: [:index]
    resources :links, only: [:index]
    resources :themes, except: [:edit]
    resources :biographies, only: [:index, :show, :edit, :update]
    resources :teams, only: [:index, :show, :edit, :update]
  end
end
