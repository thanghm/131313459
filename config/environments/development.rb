Rails.application.configure do
  
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org",
    :user_name => "postmaster@sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org",
    :password => "1edf6671acc49b95c208a21921955b89 "
  }
end
