#扩展ActionRecord::Base,使用客户化的ID
ActiveRecord::Base.send(:include,Fwk::CustomId)
# 设置全局的默认分页为每页10条
WillPaginate.per_page = 10