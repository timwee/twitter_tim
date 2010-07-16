
class TweetsController < ApplicationController
  before_filter :authorize
  def create
    current_user = User.find(session[:user_id])
    @tweet = current_user.tweets.build(params[:tweet])

    if !@tweet.save
      flash[:notice] = "Couldn't tweet, please try again"
    end

    redirect_to timeline_url
  end

end
