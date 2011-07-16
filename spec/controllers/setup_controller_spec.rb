require 'spec_helper'

describe SetupController do

  describe "GET 'install'" do
    it "should be successful" do
      get 'install'
      response.should be_success
    end
  end

  describe "GET 'services'" do
    it "should be successful" do
      get 'services'
      response.should be_success
    end
  end

end
