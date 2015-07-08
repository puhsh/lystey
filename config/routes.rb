Rails.application.routes.draw do
  root to: 'home#index'

  resources :agents, only: [:show, :edit, :update] do

    # Custom Edit Routes. Exclude the default edit routes after...
    get '/guides/edit', to: 'agents#guides', as: 'edit_guides'
    get '/brokers/edit', to: 'brokers#edit', as: 'edit_brokers'
    get '/links/edit', to: 'agents#links', as: 'edit_links'
    get '/testimonials/edit', to: 'agents#testimonials', as: 'edit_testimonials'
    get '/graphics/edit', to: 'themes#edit', as: 'edit_themes'
    get '/about/edit', to: 'biographies#edit', as: 'edit_biography'
    get '/team/edit', to: 'teams#edit', as: 'edit_team'
    get '/listings/edit', to: 'agents#listings', as: 'edit_listings'
    get '/contact', to: 'agents#contact'

    resources :biographies, except: [:edit]
    resources :brokers, except: [:edit]
    resources :guides, only: [:index]
    resources :themes, except: [:edit]
    resources :links, only: [:index]
    resources :teams, except: [:edit]
    resources :testimonials, only: [:index]
    resources :listings, only: [:index]
  end
end
