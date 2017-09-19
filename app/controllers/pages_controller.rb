class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @open_tickets = Ticket.where(taken: false).where.not(user: current_user)
    @your_tickets = Ticket.where(user: current_user)
    @taken_tickets = Ticket.where(acceptor_id: current_user.id)
    @ticket = Ticket.new
  end
end
