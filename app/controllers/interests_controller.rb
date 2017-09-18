class InterestsController < ApplicationController
  def create
    interest = Interest.new(user: current_user, topic_id: params[:topic_id])
    interest.save
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    interest = Interest.find(params[:id])
    interest.destroy
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end
