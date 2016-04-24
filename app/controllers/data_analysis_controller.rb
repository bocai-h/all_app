class DataAnalysisController < ApplicationController
  def index
    @settlements = Settlement.paginate(:page => params[:page]).order('created_at DESC')
  end

  def show
    @settlement = Settlement.find(params[:id])
    @settlement_details = @settlement.settlement_details
  end

  def service_statistics

  end
end
