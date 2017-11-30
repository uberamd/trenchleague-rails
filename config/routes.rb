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

  # schedules
  get '/schedules', to: 'schedules#index', as: 'schedules'

  root to: 'static_page#index'

  get '/rules', to: 'static_page#rules', as: 'rules'
  get '/changelog', to: 'static_page#changelog', as: 'changelog'
  get '/staff', to: 'static_page#staff', as: 'staff'

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"

  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"
  get "graphs/c3charts"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"
  get "forms/autocomplete"
  get "forms/markdown"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/profile_two"
  get "appviews/contacts_two"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/activity_stream"
  get "appviews/file_menager"
  get "appviews/vote_list"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/datamaps"
  get "miscellaneous/social_buttons"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/pdf_viewer"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/spinners_usage"
  get "miscellaneous/live_favicon"
  get "miscellaneous/masonry"
  get "miscellaneous/tour"
  get "miscellaneous/loading_buttons"
  get "miscellaneous/clipboard"
  get "miscellaneous/text_spinners"
  get "miscellaneous/truncate"
  get "miscellaneous/password_meter"
  get "miscellaneous/i18support"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/resizeable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/helper_classes"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/product_detail"
  get "commerce/orders"
  get "commerce/cart"
  get "commerce/payments"

  get "gallery/basic_gallery"
  get "gallery/slick_carusela"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"
end
