class Post < ActiveRecord::Base
  belongs_to :twitter
  belongs_to :lastfm
  
  attr_accessor :get_child
  
  def get_parent
    case self.post_type
      when "foursquare"
        self.foursquare
      when "twitter"
        self.twitter
      when "lastfm"
        self.lastfm
      when "posterous"
        self.posterous
      when "github"
        self.github
      when "instagram"
        self.instagram
    end
  end
  
end
