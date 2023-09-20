class BirthdayMailer < ApplicationMailer
  def send_birthday_email(user)
    @user = user
    mail(to: @user.email, subject: 'Happy Birthday!')
  end
end
