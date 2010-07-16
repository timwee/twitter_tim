class TimelineController < ApplicationController
  before_filter :authorize

  def index
    @user = @current_user
    @tweets = @user.subscription_timeline
  end

end
