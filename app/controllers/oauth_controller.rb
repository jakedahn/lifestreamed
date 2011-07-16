class OauthController < ApplicationController
  def instagram
    Service.create(:name => 'instagram', :username => params[:access_token])
  end

end
