#encoding: utf-8
class User < ActiveRecord::Base
  self.table_name = "users"
  # 名字必须存在  长度最大为50个字符
  validates :nick_name, presence: {message: "昵称不能为空"}
  validates :nick_name,length: {maximum: 50,too_long: "%{count} 个字符是昵称允许的最长长度"}
  # 邮箱格式验证正则表达式
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #  邮箱必输 不区分大小写
  validates :email, presence: {message: "邮箱不能为空"}
  validates :email,format: {with: VALIDATE_EMAIL_REGEX,message: "邮箱格式不合法"}
  validates :email,uniqueness: {case_sensitive: false,message: "邮箱已经被注册" }
  # 在存储之前把email全部小写化
  before_save { self.email = email.downcase }
  validates :password, presence: {message: "密码不能为空"}
  # 密码是虚拟字段只存在于内存中  最小长度为6
  validates :password, length: { minimum: 6,message: "密码最少为6位长度"}
  has_secure_password
end
