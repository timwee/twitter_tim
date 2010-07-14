# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_tim_session',
  :secret      => '79572e5a70a2f90f7b7f095ca998b3396feefe702e69ed33ef030d7035511bcfb3bb32bf55310b63169697cab56d1509596db075f0cff33a0de6438d933f779f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
