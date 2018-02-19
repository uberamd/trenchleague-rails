require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrenchleagueRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Eastern Time (US & Canada)'
    config.assets.precompile += [ 'appviews.css', 'cssanimations.css', 'dashboards.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css', 'commerce.css', 'players.css' ]
    config.assets.precompile += [ 'static_page.css', 'teams.css', 'series.css', 'admin.css', 'schedules.css', 'in_house.css', 'groups.css' ]
    config.assets.precompile += [ 'appviews.js', 'cssanimations.js', 'dashboards.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'commerce.js', 'metrics.js', 'landing.js' ]
    config.assets.precompile += [ 'static_page.js', 'teams.js', 'series.js', 'admin.js', 'schedules.js', 'in_house.js', 'players.js', 'cable.js', 'channels/room.js', 'groups.js' ]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Raven.configure do |config|
      config.dsn = 'https://a1df8ea497b04a25bd6debac7d1d3185:3b46ab1c370e49af8f694ba5562f7137@sentry.stevem.io/2'
    end
  end
end
