module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    #这里的self是必须的否则会认为current_user是一个局部变量
    self.current_user= user
  end

  def current_user= (user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token )
  end

  def current_user?(user)
   user == current_user
  end

  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please Sign in"
      store_location
      redirect_to signin_url
    end
    #简易版 flash[:error] flash[:notice]可以 flash[:success]不行
    # redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #request是rails内置的对象
  def store_location
    session[:return_to] = request.fullpath
  end

end
