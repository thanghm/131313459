Devise.setup do |config|
  config.http_authenticatable_on_xhr = false
  config.navigational_formats = ["*/*", :html, :json]
  config.mailer_sender = "'MySite' <no-reply@mysite.com>"
  
  require 'devise/orm/active_record'  

  config.authentication_keys = [ :login ]

  config.scoped_views = true
  
  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 4..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.omniauth :google_oauth2, '167718375863-rf9st8ui3lc2tabhrd4pivrfgpbt3nec.apps.googleusercontent.com', '79nyUrasK_gBEL34F6t2BlCW', scope: "email, profile, offline", prompt: "consent", setup: true
  
  config.omniauth :instagram, ENV['INSTAGRAM_APP_ID'], ENV['INSTAGRAM_APP_SECRET'], setup: true
  
  config.omniauth :facebook, '762663087178332', '09483c5ed2462581594c4e500b3f0f44', scope: "email, public_profile, user_friends, user_birthday, user_location", image_size: "normal", secure_image_url: true, setup: true
  
  config.omniauth :twitter, ENV['TWITTER_APP_ID'], ENV['TWITTER_APP_SECRET'], setup: true

end
