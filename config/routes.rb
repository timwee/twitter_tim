ActionController::Routing::Routes.draw do |map|
  map.resources :users, :except => [:destroy] do |user|
    user.resources :tweets, :except => [:destroy, :edit]
  end
  map.tweet "/users/:user_id/tweet", :controller => "tweets", :action => "create", :conditions => {:method => :post}
  map.login "/login", :controller => "users", :action => "login"
  map.logout "/logout", :controller => "users", :action => "logout"
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
