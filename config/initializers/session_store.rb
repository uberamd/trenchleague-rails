if ENV['RAILS_ENV'] == 'production'
  TrenchleagueRails::Application.config.session_store :redis_store, {
      servers: [
          {
              host: "cache",
              port: 6379,
              db: 0,
              namespace: "session"
          },
      ],
      expire_after: 30.days,
      key: "_#{Rails.application.class.parent_name.downcase}_session"
  }
else
  TrenchleagueRails::Application.config.session_store :redis_store, {
      servers: [
          {
              host: "localhost",
              port: 16379,
              db: 0,
              namespace: "session"
          },
      ],
      expire_after: 30.days,
      key: "_#{Rails.application.class.parent_name.downcase}_session"
  }
end
