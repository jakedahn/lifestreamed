class OauthController < ApplicationController
  def instagram
    if params[:access_token]
      Service.create(:name => 'instagram', :username => params[:access_token])  
      redirect_to "/"
    end
  end

end
