class UserMailer < ApplicationMailer
  def signup_confirmation(to_email, user)

    # byebug
    @data = user
    @username = @data.username
    @email = @data.email
    @password = @data.password
    @password_confirmation =@data.password_confirmation
  


    mail(to: to_email, subject: "signup", body: "@user") do |format|
      # format.text { render plain: message }
      format.html { render 'user_mailer/signup_confirmation'}
      # format.html { render 'send_mailer/send_page'}
    end
  end
end