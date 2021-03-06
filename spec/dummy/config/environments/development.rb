Dummy::Application.configure do
  config.cache_classes               = false
  config.eager_load                  = false
  config.consider_all_requests_local = true

  config.action_controller.perform_caching   = false
  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: 1025,
  }
end
