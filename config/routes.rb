Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

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
  post '/teams/:id/pay', to: 'teams#pay', as: 'pay_team'

  # admin routes
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/groups', to: 'admin#groups', as: 'groups_admin'
  post '/admin/groups', to: 'admin#groups_create', as: 'groups_create_admin'
  get '/admin/groups/:group_id/delete', to: 'admin#groups_delete', as: 'groups_delete_admin'
  post '/admin/groups/update_assignments', to: 'admin#groups_update_assignments', as: 'groups_update_assignments_admin'
  get '/admin/groups/seed', to: 'admin#seed_series', as: 'groups_seed_admin'
  post '/admin/groups/seed', to: 'admin#seed_series_update', as: 'groups_update_seeds_admin'
  get '/admin/players', to: 'admin#players', as: 'players_admin'
  put '/admin/players/update_player/:id', to: 'admin#update_player_admin', as: 'update_player_admin'
  get '/admin/settings', to: 'admin#settings', as: 'league_setting'
  patch '/admin/settings', to: 'admin#update_settings', as: 'league_settings'
  get '/admin/rules', to: 'admin#rules', as: 'rules_admin'
  get '/admin/staff', to: 'admin#staff', as: 'staff_admin'
  post '/admin/update_page', to: 'admin#update_page', as: 'update_page_admin'
  get '/admin/images', to: 'admin#images', as: 'images_admin'
  post '/admin/images', to: 'admin#upload_images', as: 'upload_images_admin'
  get '/admin/faq', to: 'admin#faq', as: 'faq_admin'
  post '/admin/faq', to: 'admin#faq_create', as: 'faq_create_admin'
  get '/admin/faq/:id', to: 'admin#faq_edit', as: 'faq_edit_admin'
  patch '/admin/faq/:id', to: 'admin#faq_update', as: 'faq_update_admin'
  get '/admin/jobs', to: 'admin#jobs', as: 'jobs_admin'
  get '/admin/jobs/:job', to: 'admin#run_job', as: 'run_job_admin'

  get '/admin/autocomplete_user_personaname', to: 'admin#autocomplete_user_personaname', as: 'autocomplete_user_personaname_admin_index'

  ## in-house admin
  get '/admin/inhouse', to: 'admin#inhouse', as: 'inhouse_admin'
  put '/admin/inhouse/update_player/:id', to: 'admin#update_player_inhouse', as: 'update_player_inhouse_admin'
  post '/admin/inhouse/match', to: 'admin#create_inhouse_match', as: 'create_inhouse_match_admin'

  # inhouse
  get '/inhouse/match/:id', to: 'in_house#show_match', as: 'show_match_inhouse'
  get '/inhouse', to: 'in_house#index', as: 'index_inhouse'
  post '/inhouse/lobby', to: 'in_house#create_lobby', as: 'create_lobby_inhouse'
  get '/inhouse/lobby/:id', to: 'in_house#show_lobby', as: 'show_lobby_inhouse'

  # series routes
  get '/series', to: 'series#index', as: 'series'
  get '/series/feed', to: 'series#calendar_feed', as: 'calendar_feed_series'
  get '/series/:id', to: 'series#show', as: 'show_series'
  post '/series/:id', to: 'series#update', as: 'update_series'
  post '/series/:id/caster', to: 'series#caster_update', as: 'caster_update_series'
  post '/series/:id/message', to: 'series#post_message', as: 'post_message_series'
  post '/series/:id/predict', to: 'series#predict_winner', as: 'predict_winner_series'

  # players routes
  get '/players/:id', to: 'players#show', as: 'show_player'
  get '/players', to: 'players#index', as: 'index_players'
  get '/settings', to: 'players#settings', as: 'settings_player'
  patch '/settings', to: 'players#update_settings', as: 'update_settings_player'

  # schedules
  get '/schedules', to: 'schedules#index', as: 'schedules'

  root to: 'static_page#index'

  get '/rules', to: 'static_page#rules', as: 'rules'
  get '/changelog', to: 'static_page#changelog', as: 'changelog'
  get '/staff', to: 'static_page#staff', as: 'staff'
  get '/distributions', to: 'static_page#distributions', as: 'distributions'
  get '/faq', to: 'static_page#faq', as: 'faq'
  post '/faq', to: 'static_page#faq_create', as: 'faq_create'
end
