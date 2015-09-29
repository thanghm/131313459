class UserMailer < ApplicationMailer
	default to: Proc.new { User.pluck(:email) },
          from: 'notification@example.com'
 
  def receive(email)
    user = User.find_by(address: email.to.first)
    user.emails.create(
      subject: email.subject,
      body: email.letter
    )
 
    if email.has_attachments?
      email.attachments.each do |attachment|
        user.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end

  def mercury_update
    newsletter = Newsletter.find(params[:id])
    newsletter.title = params[:content][:newsletter_title][:value]
    newsletter.content = params[:content][:newsletter_content][:value]
    newsletter.update_attributes(content: newsletter.content.sub!('<img src="/uploads/', '<img src="http://host.com/uploads/'))
    newsletter.save!
    render text: ""
  end
end
