# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dvd_lib_session',
  :secret      => 'd4d93a4f02cf2fc0bfeb0cd14f2ecc9faa1271ed5efd50061efbf0bfea3de07eb827f975b2572d86059be2a7d595f0fb48a15235bf8dc6883d957cf9c03a958f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
