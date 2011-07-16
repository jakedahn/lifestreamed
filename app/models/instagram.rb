class Instagram < ActiveRecord::Base
  has_one :post
  after_create :create_post
  validates_uniqueness_of :gram_id

private
  def create_post
    Post.create(:post_type => "instagram", :instagram_id => self.id, :created_at => self.created_at)
  end
end
