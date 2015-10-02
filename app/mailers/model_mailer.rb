class ModelMailer < ApplicationMailer
	default from: "me@MYDOMAIN.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #

	def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new 'key-709615e8f60b6403b5548403328da502'
    message_params = {:from    => 'postmaster@sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org',
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message 'sandboxf507c6cf467a40e2ad0cb97a001b59ce.mailgun.org', message_params
  end
end
