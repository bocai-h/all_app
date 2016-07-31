class UserGeneral < ApplicationRecord
  # 一个人只有一套资料
  validates :user_id,uniqueness: true,message: "用户的基本资料已经存在"
  validates_presence_of :name,message: "姓名不能为空"
  validates_presence_of :sex,"性别不能为空"
  validates_presence_of  :mobile_phone,message: "联系方式不能为空"
  # age只允许为整数且最大要小于140
  validates :age,numericality: { only_integer: true,less_than: 140 },message: "年龄只能为整数"
end
