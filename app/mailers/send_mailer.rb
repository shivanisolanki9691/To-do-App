# class SendMailer < ActionMailer::Base
#   def send_email(to, todo)
#     @todo = todo
#     mail(to: to, subject: "Todos List", body:  "Here is your todo: #{@todo}")
#   end
# end


class SendMailer < ApplicationMailer
  def send_email(to_email, todo)

    # byebug
    @data = todo
    @name = @data.name
    @day = @data.day
    attachments.inline['image.png'] = File.read("#{Rails.root}/app/assets/images/image.png")


    mail(to: to_email, subject: "Todo list", body: "@todo") do |format|
      # format.text { render plain: message }
      format.html { render 'send_mailer/send_email'}
      # format.html { render 'send_mailer/send_page'}
    end
  end
end