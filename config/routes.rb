Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/logout'

  # this is where steam login returns back to
  post '/auth/steam/callback', to: 'sessions#create'

  # team routes
  resources :teams

  root to: 'static_page#index'
end
