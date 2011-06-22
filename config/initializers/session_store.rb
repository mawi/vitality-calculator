# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vitality-calculator_session',
  :secret      => 'd1ed9153f1d14abfb8ff384a702bd88d970af4c89eec3e115be8cd58347593b8ec8178c4d67f88c7e64f6f77afa19b158adb69402d98b5db08071760ba989ce5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
