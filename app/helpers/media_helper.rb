module MediaHelper
  def status_meaning status_code
    case status_code
      when "NO"
        "初始"
      when "CHANGE"
        "排队中"
      when "RUNNING"
        "正在转换"
      when "COMPLETE"
        "完成"
    end
  end
end
