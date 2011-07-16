class SetupController < ApplicationController
  def install
    
    client_id = ENV['instagram_client_id'].blank? ? API_KEYS['instagram']['client_id'] : ENV['instagram_client_id']
    redirect_url = ENV['instagram_redirect_url'].blank? ? API_KEYS['instagram']['redirect_url'] : ENV['instagram_redirect_url']
    
    @instagram_auth_url = "https://instagram.com/oauth/authorize/?client_id=#{client_id}&redirect_uri=#{redirect_url}&response_type=token"
    
    
  end

  def services
  end

end
