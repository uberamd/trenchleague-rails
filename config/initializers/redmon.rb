require 'redmon/config'
require 'redmon/redis'
require 'redmon/app'

#
# Optional config overrides
#
Redmon.configure do |config|
  config.redis_url = "redis://:#{ENV['REDIS_password']}@redis:6379"
  config.namespace = 'redmon'
end
