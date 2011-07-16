class SetupController < ApplicationController
  def install
    @instagram_auth_url = "https://instagram.com/oauth/authorize/?client_id=#{API_KEYS['instagram']['client_id']}&redirect_uri=#{API_KEYS['instagram']['redirect_url']}&response_type=token"
    
    
  end

  def services
  end

end
