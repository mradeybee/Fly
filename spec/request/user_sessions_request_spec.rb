require 'rails_helper'

describe "GET '/auth/facebook/callback'" do

  before(:each) do
    set_valid_omniauth
    get "auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end
end