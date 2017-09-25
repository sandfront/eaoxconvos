class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    @greeting = "#{user.first_name}"
    mail(to: @user.email, subject: 'Welcome to EA Ox Conversations')
    # This will render a view in `app/views/user_mailer`!
  end

  def newsletter(user)
    @user = user
    @tickets = Ticket.where(taken: false).where.not(permanent: true)
    @past_tickets = Ticket.where(taken: true).where.not(permanent: true)
    mail(to: @user.email, subject: "This week in EA Ox Conversations")
  end
end
