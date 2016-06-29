class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  layout :which_layout

  private
  def which_layout
    # 默认使用application模板
    if request.env["HTTP_X_REQUESTED_WITH"].blank?
      "application"
    else
      #ajax请求不使用模板
      false
    end
  end
end
