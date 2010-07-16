ActionController::Routing::Routes.draw do |map|
  map.resources :subscriptions

  map.resources :users, :except => [:destroy] do |user|
    user.resources :tweets, :except => [:destroy, :edit]
  end
  map.timeline "/timeline", :controller => "timeline", :conditions => { :method => :get }
  map.tweet "/users/:user_id/tweet", :controller => "tweets", :action => "create", :conditions => {:method => :post}
  map.login "/login", :controller => "users", :action => "login"
  map.logout "/logout", :controller => "users", :action => "logout"
  map.root :controller => "timeline"
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
