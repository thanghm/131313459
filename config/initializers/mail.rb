ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => "asuka.uit@gmail.com",
    :password  => 'vsH8-zoNdGUbSVC5jeCgMw',
    :domain => 'gmail.com',
    :authentication => "login",
    :enable_starttls_auto => true
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'vsH8-zoNdGUbSVC5jeCgMw'
end