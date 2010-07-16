class TimelineController < ApplicationController
  before_filter :authorize

  def index
    @user = @current_user
    @tweets = @user.tweets
  end

end
