class DataAnalysisController < ApplicationController
  def index
    @settlements = Settlement.paginate(:page => params[:page]).order('created_at DESC')
  end

  def show
    @settlements = Settlement.find(params[:id])
  end
end
