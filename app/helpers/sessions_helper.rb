module SessionsHelper
  def log_out
    session.delete(:admin_id)
    @current_user = nil
  end

  def log_in(user)
    session[:admin_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
