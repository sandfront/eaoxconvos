class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end


  def create
    ticket = Ticket.new(ticket_params)
    ticket.user = current_user
    ticket.save
    redirect_to root_path
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    redirect_to root_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
