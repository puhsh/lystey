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
    get '/team', to: 'teams#show'

    resources :biographies, except: [:edit]
    resources :brokers, except: [:edit]
    resources :guides, only: [] do
      collection do
        get :buyers
        get :sellers
      end
    end

    resources :team_openings, only: [:index]

    resources :themes, except: [:edit, :show]
    resources :links, only: [:index]
    resources :teams, except: [:edit]
    resources :testimonials, only: [:index]
    resources :listings, only: [:index]
  end
end
