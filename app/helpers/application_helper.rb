# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_logged_in?
    !session[:user_id].nil?
  end
  def is_current_user?(user)
    user.id == session[:user_id]
  end

  def following?(user)
    User.find_by_id(session[:user_id]).is_following? user.id
  end

end
