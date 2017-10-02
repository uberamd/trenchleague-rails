Rails.application.routes.draw do


  get 'schedules/index'

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
  get '/admin/players', to: 'admin#players', as: 'players_admin'
  get '/admin/settings', to: 'admin#settings', as: 'league_setting'
  patch '/admin/settings', to: 'admin#update_settings', as: 'league_settings'
  get '/admin/rules', to: 'admin#rules', as: 'rules_admin'
  post '/admin/update_page', to: 'admin#update_page', as: 'update_page_admin'

  # series routes
  get '/series', to: 'series#index', as: 'series'
  get '/series/feed', to: 'series#calendar_feed', as: 'calendar_feed_series'
  get '/series/:id', to: 'series#show', as: 'show_series'
  post '/series/:id', to: 'series#update', as: 'update_series'
  post '/series/:id/caster', to: 'series#caster_update', as: 'caster_update_series'
  post '/series/:id/message', to: 'series#post_message', as: 'post_message_series'

  # players routes
  get '/players/:id', to: 'players#show', as: 'show_player'

  # schedules
  get '/schedules', to: 'schedules#index', as: 'schedules'

  root to: 'static_page#index'

  get '/rules', to: 'static_page#rules', as: 'rules'
end
