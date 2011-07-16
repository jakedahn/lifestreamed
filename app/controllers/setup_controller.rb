class SetupController < ApplicationController
  def install
    @instagram_auth_url = "https://instagram.com/oauth/authorize/?client_id=#{API_KEYS['instagram']['client_id']}&redirect_uri=#{request.url}oauth/instagram/&response_type=token"
    
    
  end

  def services
  end

end
