TrenchleagueRails::Application.config.session_store :redis_store, {
    servers: [
        {
            host: "localhost",
            port: 16379,
            db: 0,
            namespace: "session"
        },
    ],
    expire_after: 90.minutes,
    key: "_#{Rails.application.class.parent_name.downcase}_session"
}