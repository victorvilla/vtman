module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= GuidesparkUser.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

   # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def iswriter?
    @current_user.profile == 2
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
