module UsersHelper
  def is_current_user?(user)
    user.id == session[:user_id]
  end

  def following?(user)
    User.find_by_id(session[:user_id]).is_following? user.id
  end
end
