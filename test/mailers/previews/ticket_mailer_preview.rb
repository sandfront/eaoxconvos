class TicketMailerPreview < ActionMailer::Preview
  def match
    ticket = Ticket.where(taken: true).first
    TicketMailer.match(ticket)
  end
end
