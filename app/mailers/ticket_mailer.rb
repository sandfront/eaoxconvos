class TicketMailer < ApplicationMailer
  def match(ticket)
    @ticket = ticket
    @greeting = "Hi"
    @creator = ticket.user
    @acceptor = User.find(ticket.acceptor_id)
    mail to: [@creator.email, @acceptor.email], subject: "You've got a match of EA Ox Conversations!"
  end

  def feedback_acceptor(ticket)
    @ticket = ticket
    @greeting = "Hey"
    @user = User.find(ticket.acceptor_id)
    mail to: [@user.email], subject: "How was the EA Ox Conversation?"
  end

  def feedback_creator(ticket)
    @ticket = ticket
    @greeting = "Hey"
    @user = ticket.user
    mail to: [@user.email], subject: "How was the EA Ox Conversation?"
  end

end
