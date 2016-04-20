class DataImportController < ApplicationController
  def index
  end

  def record_data
    message = Settlement.import_data(params[:file_field])
    if message == "error"
      redirect_to({:controller => "data_import",:action => "index"}, notice: "导入模板错误!!")
    else
      redirect_to({:controller => "data_import",:action => "index"}, notice: "导入模板成功")
    end
  end
end
