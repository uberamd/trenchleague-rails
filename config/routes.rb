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
  get '/teams/:id/user/:user/smurf/:smurfaction', to: 'teams#smurf_check', as: 'smurf_update_team'

  # admin routes
  get '/admin/groups', to: 'admin#groups', as: 'groups_admin'
  post '/admin/groups', to: 'admin#groups_create', as: 'groups_create_admin'
  get '/admin/groups/:group_id/delete', to: 'admin#groups_delete', as: 'groups_delete_admin'
  post '/admin/groups/update_assignments', to: 'admin#groups_update_assignments', as: 'groups_update_assignments_admin'

  root to: 'static_page#index'
end
