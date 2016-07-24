class UserGeneral < ActiveRecord::Base
  self.table_name = "user_generals"

  # 一个人只有一套资料
  validates :user_id,uniqueness: true
end
