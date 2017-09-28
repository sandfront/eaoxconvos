class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end


  def create
    ticket = Ticket.new(ticket_params)
    ticket.user = current_user
    ticket.save
    redirect_to ticket_path(ticket), notice: "You have successfully submitted a topic."
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    redirect_to root_path
  end

  def take_ticket
    ticket = Ticket.find(params[:id])
    ticket.acceptor_id = current_user.id
    unless ticket.permanent == true
      ticket.taken = true
    end
    ticket.save
    TicketMailer.match(ticket).deliver_now
    TicketMailer.feedback_creator(ticket).deliver_later(wait: 1.week)
    TicketMailer.feedback_acceptor(ticket).deliver_later(wait: 1.week)
    redirect_to root_path, notice: "Great, we've signed you up. Check your email inbox!"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :anonymous)
  end
end
