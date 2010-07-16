require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :tweets
  has_many :subscriptions
  has_many :friends, :through => :subscriptions
  has_many :follower_relations, :class_name => "Subscription", :foreign_key => "friend_id"
  has_many :followers, :through => :follower_relations, :source => :user

  validates_presence_of     :name
  validates_uniqueness_of   :name

  attr_accessor   :password_confirmation
  validates_confirmation_of :password
  validate   :password_non_blank

  @@key = "key"

  def password
    @password
  end

  def subscription_timeline(offset=0)
    friend_ids = subscriptions.map { |s| s.friend_id }
    Tweet.find(:all, :conditions=> ["user_id in (:user_ids)", { :user_ids => friend_ids << id }], :limit => 10, :offset => offset)
  end

  def num_followers
    followers.count
  end


  def following
    subscriptions.map do |relation|
      User.find_by_id(relation.friend_id)
    end
  end

  def is_following?(user_id)
    Subscription.exists?(:user_id => id, :friend_id => user_id)
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      logger.error expected_password
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

#  private
  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + @@key + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end


