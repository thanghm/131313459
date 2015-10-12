class AppMailer < ApplicationMailer
	after_action :set_resume_headers
  def email_name(post, user_email)
		@post = post
		@user_email = user_email
    mail(:subject => "#{@post.company} are looking for candidates like you",
         :to      => @user_email,
         :from    => "123@gmail.com"
    ) do |format|
      format.html { render layout: 'autosend' }
    end
  end

  def apply_job(post, user_post, user, resume, send_post)
    @post = post
    @user_post = user_post
    @send_post = send_post
    @user = user
    @resume = resume
    @mail = [@user.email, @user_post.email]
    attachments[resume.attachment.original_filename] = File.read("#{Rails.root}/public"+resume.attachment_url)
    mail(:subject => "#{@user.fullname} Apply for #{@post.title}",
         :to =>      @user_post.email,
         :from =>    "activejob@gmail.com",
         :body =>    @resume.letter
         ) do |format|
      format.html { render layout: 'mailer' }
    end
    AppMailer.service_job(@post, @user, @send_post).deliver
  end

  def service_job(post, user, send_post)
    @post = post
    @user = user
    @send_post = send_post
    mail(:subject => "service",
         :to      => @user.email,
         :from    => "service@gmail.com",
    ) do |format|
      format.html { render layout: 'send_post' }
    end
  end

  private
 
    def set_resume_headers
      if @resume
        headers["X-SMTPAPI-CATEGORY"] = @resume.attachment.original_filename
      end
    end
end
