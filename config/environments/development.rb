Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    #config.action_controller.perform_caching = false

    #config.cache_store = :null_store
    config.cache_store = :redis_store, "redis://localhost:16379/0/cache", { expires_in: 90.minutes }
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false


  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               ENV["SMTP_DOMAIN"],
      user_name:            ENV["SMTP_USERNAME"],
      password:             ENV["SMTP_PASSWORD"],
      authentication:       'plain',
      enable_starttls_auto: true
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
          bucket: 'my-dev-bucket',
          access_key_id: ENV['AWS_ACCESS_KEY'],
          secret_access_key: ENV['AWS_SECRET_KEY'],
          region: 'us-east-1'
      },
      s3_options: {
          force_path_style: true,
          endpoint: 'http://localhost:9000'
      },
      s3_region: 'us-east-1',
      s3_host_name: 'minio:9000',
      path: '/:class/:attachment/:id_partition/:style/:filename'
  }

  config.autoload_paths += %W(#{config.root}/app/policies)
  config.action_cable.url = 'ws://localhost:3000/cable'
end
