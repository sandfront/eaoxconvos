class TicketMailerPreview < ActionMailer::Preview
  def match
    ticket = Ticket.where(taken: true).first
    TicketMailer.match(ticket)
  end

  def feedback_acceptor
    ticket = Ticket.where(taken: true).first
    TicketMailer.feedback_acceptor(ticket)
  end

  def feedback_creator
    ticket = Ticket.where(taken: true).first
    TicketMailer.feedback_creator(ticket)
  end
end
