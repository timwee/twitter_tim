class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body, :username

  default_scope :order => "created_at DESC"
  before_validation_on_create :username_from_user

  private
  def username_from_user
    self.username = user.name
  end
end
