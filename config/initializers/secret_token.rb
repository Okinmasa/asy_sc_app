# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# AsyScApp::Application.config.secret_key_base = 'cfb1f760f6cb986d22d9a038a151d59a6c700feda9f2163a97332dc0ae84a864689b113b9e97eb25b229f2062dfc9bb2f253bacf3db6abd22e33645bcb75b2ab'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

AsyScApp::Application.config.secret_key_base = secure_token

