Rails.application.routes.draw do


  get 'players/show'

  get 'series/show'

  # SESSION ROUTES
  ## this is where steam login returns back to
  post '/auth/steam/callback', to: 'sessions#create'
  ## logout
  get '/logout', to: 'sessions#logout'

  # team routes
  resources :teams
  get '/teams/:id/join', to: 'teams#join_request', as: 'join_team'
  get '/teams/:id/join/:user/approve', to: 'teams#join_approve', as: 'approve_join_team'
  get '/teams/:id/join/:user/reject', to: 'teams#join_reject', as: 'reject_join_team'
  get '/teams/:id/user/:user/smurf/:smurfaction', to: 'teams#smurf_check', as: 'smurf_update_team'

  # admin routes
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/groups', to: 'admin#groups', as: 'groups_admin'
  post '/admin/groups', to: 'admin#groups_create', as: 'groups_create_admin'
  get '/admin/groups/:group_id/delete', to: 'admin#groups_delete', as: 'groups_delete_admin'
  post '/admin/groups/update_assignments', to: 'admin#groups_update_assignments', as: 'groups_update_assignments_admin'
  get '/admin/groups/seed', to: 'admin#seed_series', as: 'groups_seed_admin'
  post '/admin/groups/seed', to: 'admin#seed_series_update', as: 'groups_update_seeds_admin'

  # series routes
  get '/series', to: 'series#index', as: 'series'
  get '/series/:id', to: 'series#show', as: 'show_series'
  post '/series/:id', to: 'series#update', as: 'update_series'

  # players routes
  get '/players/:id', to: 'players#show', as: 'show_player'

  root to: 'static_page#index'
end
