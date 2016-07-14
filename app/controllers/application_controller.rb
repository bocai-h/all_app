class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # 处理所有的controller的记录未找到异常
  if Rails.env.production?
    # 没作用
    rescue_from ActiveRecord::RecordNotFound,with: :record_not_found
    # 也可以在controller这一层去拦截非法路由
    # rescue_from ActionController::RoutingError,with: :render_error_404
  end
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

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
