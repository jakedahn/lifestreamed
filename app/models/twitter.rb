class Twitter < ActiveRecord::Base
  has_one :post
  after_create :create_post


private
  def create_post
    Post.create(:post_type => "twitter", :twitter_id => self.id, :created_at => self.created_at)
  end
end
