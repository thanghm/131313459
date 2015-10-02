Rails.application.configure do
 
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.log_level = :debug

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new
  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.action_mailer.delivery_method = :smtp
  # SMTP settings for mailgun
  ActionMailer::Base.smtp_settings = {
    :port           => 587,
    :address        => "smtp.mailgun.org",
    :domain         => 'sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org',
    :user_name      => 'postmaster@sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org',
    :password       => '1edf6671acc49b95c208a21921955b89 '
    :authentication => :plain,
  }}
end
