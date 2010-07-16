class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validate :cant_follow_self

  private
  def cant_follow_self()
    errors.add(:friend_id, "Can't follow yourself!") if friend_id == user_id
  end
end
