class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.ticket = Ticket.find(params[:ticket_id])
    comment.save
    redirect_to ticket_path(comment.ticket)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to ticket_path(comment.ticket)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :ticket)
  end
end
