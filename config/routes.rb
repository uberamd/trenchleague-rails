Rails.application.routes.draw do


  # SESSION ROUTES
  ## this is where steam login returns back to
  post '/auth/steam/callback', to: 'sessions#create'
  ## logout
  get '/logout', to: 'sessions#logout'

  # team routes
  resources :teams
  get '/teams/:id/join', to: 'teams#join_request', as: 'join_team'
  get '/teams/:id/join/:user/approve', to: 'teams#join_approve', as: 'approve_join_team'

  root to: 'static_page#index'
end
