module MediaHelper
  def status_meaning status_code
    status = ""
    case status_code
      when "NO"
        status = "<span class='label label-default'>初始</span>"
      when "CHANGE"
        status = "<span class='label label-primary'>排队中</span>"
      when "RUNNING"
        status = "<span class='label label-info'>运行中</span>"
      when "COMPLETE"
        status = "<span class='label label-success'>完成</span>"
    end
    status.html_safe
  end

  def process_url absolute_url
    request.host + ":" + request.port.to_s + absolute_url.gsub("#{Rails.root.to_s}","")
  end
end
