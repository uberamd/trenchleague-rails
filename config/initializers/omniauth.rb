Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :steam, ENV['STEAM_WEB_API_KEY']
  provider :steam, '711E7AAD4D8935151C9C11B29DCC03C2'
end