class User < ActiveRecord::Base
  self.table_name = "users"
  # 名字必须存在  长度最大为50个字符
  validates :name, presence: true, length: { maximum: 50 }
  # 邮箱格式验证正则表达式
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #  邮箱必输 不区分大小写
  validates :email, presence: true, format: { with: VALIDATE_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  # 在存储之前把email全部小写化
  before_save { self.email = email.downcase }

  has_secure_password

  # 密码是虚拟字段只存在于内存中  最小长度为6
  validates :password, length: { minimum: 6 }

end
