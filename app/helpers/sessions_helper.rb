module SessionsHelper
  def sign_in(user)
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def is_admin?
    current_user.admin?
  end

  def comment_by_user?(user)
    user == current_user
  end
end
