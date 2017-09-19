class TicketMailer < ApplicationMailer
  def match(ticket)
    @ticket = ticket
    @greeting = "Hi"
    @creator = ticket.user
    @acceptor = User.find(ticket.acceptor_id)
    mail to: [@creator.email, @acceptor.email], subject: "You've got a match of EA Ox Conversations!"
  end
end
