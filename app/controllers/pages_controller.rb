class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ticket = Ticket.new
    @open_tickets = Ticket.where(taken: false).where.not(permanent: true)
    @committee_tickets = Ticket.where(permanent: true)
    if current_user
      @taken_tickets = Ticket.where(acceptor_id: current_user.id)
    end
  end

  def demo
    @open_tickets = Ticket.where(taken: false).where.not(user: current_user)
    @your_tickets = Ticket.where(user: current_user)
    @taken_tickets = Ticket.where(acceptor_id: current_user.id)
    @ticket = Ticket.new
  end
end
