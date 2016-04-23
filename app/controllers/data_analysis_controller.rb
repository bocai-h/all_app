class DataAnalysisController < ApplicationController
  def index
    @settlements = Settlement.all
  end
end
