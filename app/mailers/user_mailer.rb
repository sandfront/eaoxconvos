class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    @greeting = "#{user.first_name}"
    mail(to: @user.email, subject: 'Welcome to EA Ox Conversations')
    # This will render a view in `app/views/user_mailer`!
  end
end
