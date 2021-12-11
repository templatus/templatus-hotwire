Rails.application.config.session_store :cookie_store,
                                       key:
                                         "#{Rails.configuration.force_ssl ? '__Host-' : '_'}templatus_session",
                                       secure: Rails.configuration.force_ssl
