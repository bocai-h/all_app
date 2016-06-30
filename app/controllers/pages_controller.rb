class PagesController < ApplicationController
  def error_404
    # 对于正常路由访问直接返回404报错页面
    render file: "#{Rails.root}/public/404.html"
  end
end
