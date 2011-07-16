require 'spec_helper'

describe OauthController do

  describe "GET 'instagram'" do
    it "should be successful" do
      get 'instagram'
      response.should be_success
    end
  end

end
