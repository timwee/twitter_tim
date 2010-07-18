
class TweetsController < ApplicationController
  before_filter :authorize
  def create
    current_user = User.find(session[:user_id])
    @tweet = current_user.tweets.build(params[:tweet])
    logger.error @tweet
    if !@tweet.save
      flash[:notice] = "Couldn't tweet, please try again"
      logger.error "**************Coulnt's save"
    end
    respond_to do |format|
      format.html { redirect_to timeline_url }
      format.js { render :partial => "tweet/show", :layout => "tweet/tweets", :locals => { :tweet => @tweet } }
    end

  end

end
