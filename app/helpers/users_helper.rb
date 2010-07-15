module UsersHelper
  def is_current_user?
    params[:id] == session[:user_id]
  end
end
