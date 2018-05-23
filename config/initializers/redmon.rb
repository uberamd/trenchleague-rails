require 'redmon/config'
require 'redmon/redis'
require 'redmon/app'

#
# Optional config overrides
#
Redmon.configure do |config|
  config.redis_url = ENV['REDIS_uri']
  config.namespace = 'redmon'
  config.password = ENV['REDIS_password']
end
