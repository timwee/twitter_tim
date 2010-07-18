 class SubscriptionsController < ApplicationController
  before_filter :authorize
  def create
    @subscription = @current_user.subscriptions.build(:friend_id => params[:friend_id])
    if @subscription.save
      flash[:notice] = "Successfully followed #{params[:friend_name]}"
      redirect_to root_url
    else
      flash[:notice] = "Unable to follow #{params[:friend_name]}"
      redirect_to root_url
    end
  end

  def destroy
    @subscription = @current_user.subscriptions.find_by_friend_id(params[:friend_id])
    @subscription.destroy
    flash[:notice] = "Successfully unfollowed #{params[:friend_name]}"
    redirect_to root_url
  end
end
