class Lastfm < ActiveRecord::Base
  has_one :post
  after_create :create_post
  validates_uniqueness_of :t_id

private
  def create_post
    Post.create(:post_type => "twitter", :twitter_id => self.id, :created_at => self.created_at)
  end
end
