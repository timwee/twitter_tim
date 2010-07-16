class AddUsernameToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :username, :string
  end

  def self.down
    remove_column :tweets, :username
  end
end
