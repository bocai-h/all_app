class CommonController < ApplicationController
  # layout "full_window", :only => [:index,:my_door]
  def index
    # render :layout => false
  end

  def login
    respond_to do |format|
      format.js
    end
  end
end
