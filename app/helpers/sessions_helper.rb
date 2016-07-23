module SessionsHelper
  def sign_in(user)
    # 新生成一个记忆权标
    remember_token = User.new_remember_token
    # cookie存储remember_token
    cookies.permanent[:remember_token] = remember_token
    # 更新用户的记忆权标
    user.update_attribute("remember_token",User.encrypt(remember_token))
    # 设置当前用户
    self.current_user = user
  end

  def current_user=(user)
    # 创建了一个实例变量
    @current_user = user
  end

  def current_user
    # 数据库中存储的是加密过后的权标
    remember_token = User.encrypt(cookies[:remember_token])
    @curren_user ||= User.find_by_remember_token(remember_token)
  end

  def sign_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def remember_me user_name
    cookies[:user_name] = {:value => user_name,:expires => 1.minute.from_now }
  end
end
