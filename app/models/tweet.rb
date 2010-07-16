class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body

  default_scope :order => "created_at DESC"
end
