class MediaController < ApplicationController
  def update
    media = Medium.find(params[:media_id])
    media.update_attribute(:status,"CHANGE")
    respond_to do |format|
      format.json {render :json => {status: "ok"}}
    end
  end
end
